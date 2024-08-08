# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

CREATE OR REPLACE FUNCTION `$BQ_PROJECT.$BQ_DATASET`.theta_sketch_get_estimate_and_bounds(base64 BYTES, num_std_devs INT, seed INT64)
RETURNS ARRAY<FLOAT64> LANGUAGE js
OPTIONS (
  library=["$GCS_BUCKET/theta_sketch.js"],
  description = '''Gets cardinality estimate and bounds from given sketch.
Param base64: The given sketch to query as bytes.
Param num_std_devs: The returned bounds will be based on the statistical confidence interval determined by the given number of standard deviations
from the returned estimate. This number may be one of {1,2,3}, where 1 represents 68% confidence, 2 represents 95% confidence and 3 represents 99.7% confidence.
For example, if the given num_std_devs = 2 and the returned values are {1000, 990, 1010} that means that with 95% confidence, the true value lies within 
the range [990, 1010].
Param seed: This is used to confirm that the given sketch was configured with the correct seed.
Returns an array of 3 FLOAT64 values as {estimate, lowerBound, upperBound}.
For more details: https://datasketches.apache.org/docs/Theta/ThetaSketchFramework.html'''
) AS R"""
const default_seed = BigInt(9001);
try {
  var sketch = Module.compact_theta_sketch.deserializeFromB64(base64, seed ? BigInt(seed) : default_seed);
  try {
    return [sketch.getEstimate(), sketch.getLowerBound(num_std_devs), sketch.getUpperBound(num_std_devs)];
  } finally {
    sketch.delete();
  }
} catch (e) {
  throw new Error(Module.getExceptionMessage(e));
}
""";
