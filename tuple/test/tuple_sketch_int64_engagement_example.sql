/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

# for details see https://datasketches.apache.org/docs/Tuple/TupleEngagementExample.html
declare result_sketch bytes;
create temp table raw_data(day int, id int);
insert into raw_data values
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(1, 4),
(1, 5),
(2, 4),
(2, 5),
(3, 4),
(3, 5),
(4, 4),
(4, 5),
(5, 4),
(5, 5),
(6, 4),
(6, 5),
(7, 4),
(7, 5),
(8, 4),
(8, 5),
(9, 4),
(9, 5),
(10, 4),
(10, 5),
(11, 4),
(11, 5),
(12, 4),
(12, 5),
(13, 4),
(13, 5),
(14, 4),
(14, 5),
(15, 4),
(15, 5),
(16, 4),
(16, 5),
(17, 4),
(17, 5),
(18, 4),
(18, 5),
(19, 4),
(19, 5),
(1, 6),
(1, 7),
(2, 6),
(2, 7),
(3, 6),
(3, 7),
(4, 6),
(4, 7),
(5, 6),
(5, 7),
(6, 6),
(6, 7),
(7, 6),
(7, 7),
(8, 6),
(8, 7),
(9, 6),
(9, 7),
(10, 6),
(10, 7),
(11, 6),
(11, 7),
(12, 6),
(12, 7),
(13, 6),
(13, 7),
(14, 6),
(14, 7),
(15, 6),
(15, 7),
(16, 6),
(16, 7),
(17, 6),
(17, 7),
(1, 8),
(1, 9),
(2, 8),
(2, 9),
(3, 8),
(3, 9),
(4, 8),
(4, 9),
(5, 8),
(5, 9),
(6, 8),
(6, 9),
(7, 8),
(7, 9),
(8, 8),
(8, 9),
(9, 8),
(9, 9),
(10, 8),
(10, 9),
(11, 8),
(11, 9),
(12, 8),
(12, 9),
(13, 8),
(13, 9),
(14, 8),
(14, 9),
(15, 8),
(15, 9),
(1, 10),
(1, 11),
(2, 10),
(2, 11),
(3, 10),
(3, 11),
(4, 10),
(4, 11),
(5, 10),
(5, 11),
(6, 10),
(6, 11),
(7, 10),
(7, 11),
(8, 10),
(8, 11),
(9, 10),
(9, 11),
(10, 10),
(10, 11),
(11, 10),
(11, 11),
(12, 10),
(12, 11),
(13, 10),
(13, 11),
(14, 10),
(14, 11),
(1, 12),
(1, 13),
(2, 12),
(2, 13),
(3, 12),
(3, 13),
(4, 12),
(4, 13),
(5, 12),
(5, 13),
(6, 12),
(6, 13),
(7, 12),
(7, 13),
(8, 12),
(8, 13),
(9, 12),
(9, 13),
(10, 12),
(10, 13),
(11, 12),
(11, 13),
(12, 12),
(12, 13),
(1, 14),
(1, 15),
(1, 16),
(2, 14),
(2, 15),
(2, 16),
(3, 14),
(3, 15),
(3, 16),
(4, 14),
(4, 15),
(4, 16),
(5, 14),
(5, 15),
(5, 16),
(6, 14),
(6, 15),
(6, 16),
(7, 14),
(7, 15),
(7, 16),
(8, 14),
(8, 15),
(8, 16),
(9, 14),
(9, 15),
(9, 16),
(10, 14),
(10, 15),
(10, 16),
(11, 14),
(11, 15),
(11, 16),
(1, 17),
(1, 18),
(1, 19),
(2, 17),
(2, 18),
(2, 19),
(3, 17),
(3, 18),
(3, 19),
(4, 17),
(4, 18),
(4, 19),
(5, 17),
(5, 18),
(5, 19),
(6, 17),
(6, 18),
(6, 19),
(7, 17),
(7, 18),
(7, 19),
(8, 17),
(8, 18),
(8, 19),
(9, 17),
(9, 18),
(9, 19),
(10, 17),
(10, 18),
(10, 19),
(1, 20),
(1, 21),
(1, 22),
(2, 20),
(2, 21),
(2, 22),
(3, 20),
(3, 21),
(3, 22),
(4, 20),
(4, 21),
(4, 22),
(5, 20),
(5, 21),
(5, 22),
(6, 20),
(6, 21),
(6, 22),
(7, 20),
(7, 21),
(7, 22),
(8, 20),
(8, 21),
(8, 22),
(9, 20),
(9, 21),
(9, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(4, 23),
(4, 24),
(4, 25),
(4, 26),
(5, 23),
(5, 24),
(5, 25),
(5, 26),
(6, 23),
(6, 24),
(6, 25),
(6, 26),
(7, 23),
(7, 24),
(7, 25),
(7, 26),
(8, 23),
(8, 24),
(8, 25),
(8, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(4, 27),
(4, 28),
(4, 29),
(4, 30),
(5, 27),
(5, 28),
(5, 29),
(5, 30),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(7, 27),
(7, 28),
(7, 29),
(7, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(4, 31),
(4, 32),
(4, 33),
(4, 34),
(4, 35),
(5, 31),
(5, 32),
(5, 33),
(5, 34),
(5, 35),
(6, 31),
(6, 32),
(6, 33),
(6, 34),
(6, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(3, 36),
(3, 37),
(3, 38),
(3, 39),
(3, 40),
(4, 36),
(4, 37),
(4, 38),
(4, 39),
(4, 40),
(5, 36),
(5, 37),
(5, 38),
(5, 39),
(5, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(3, 41),
(3, 42),
(3, 43),
(3, 44),
(3, 45),
(3, 46),
(4, 41),
(4, 42),
(4, 43),
(4, 44),
(4, 45),
(4, 46),
(5, 41),
(5, 42),
(5, 43),
(5, 44),
(5, 45),
(5, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(3, 47),
(3, 48),
(3, 49),
(3, 50),
(3, 51),
(3, 52),
(3, 53),
(4, 47),
(4, 48),
(4, 49),
(4, 50),
(4, 51),
(4, 52),
(4, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(3, 54),
(3, 55),
(3, 56),
(3, 57),
(3, 58),
(3, 59),
(3, 60),
(3, 61),
(4, 54),
(4, 55),
(4, 56),
(4, 57),
(4, 58),
(4, 59),
(4, 60),
(4, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(3, 62),
(3, 63),
(3, 64),
(3, 65),
(3, 66),
(3, 67),
(3, 68),
(3, 69),
(3, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(3, 71),
(3, 72),
(3, 73),
(3, 74),
(3, 75),
(3, 76),
(3, 77),
(3, 78),
(3, 79),
(3, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(3, 81),
(3, 82),
(3, 83),
(3, 84),
(3, 85),
(3, 86),
(3, 87),
(3, 88),
(3, 89),
(3, 90),
(3, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(2, 133),
(2, 134),
(2, 135),
(2, 136),
(2, 137),
(2, 138),
(2, 139),
(2, 140),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(2, 147),
(2, 148),
(2, 149),
(1, 150),
(1, 151),
(1, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(2, 150),
(2, 151),
(2, 152),
(2, 153),
(2, 154),
(2, 155),
(2, 156),
(2, 157),
(2, 158),
(2, 159),
(2, 160),
(2, 161),
(2, 162),
(2, 163),
(2, 164),
(2, 165),
(2, 166),
(2, 167),
(2, 168),
(1, 169),
(1, 170),
(1, 171),
(1, 172),
(1, 173),
(1, 174),
(1, 175),
(1, 176),
(1, 177),
(1, 178),
(1, 179),
(1, 180),
(1, 181),
(1, 182),
(1, 183),
(1, 184),
(1, 185),
(1, 186),
(1, 187),
(1, 188),
(1, 189),
(1, 190),
(1, 191),
(1, 192),
(1, 193),
(1, 194),
(1, 195),
(1, 196),
(1, 197),
(1, 198),
(1, 199),
(1, 200),
(1, 201),
(1, 202),
(1, 203),
(1, 204),
(1, 205),
(1, 206),
(1, 207),
(1, 208),
(1, 209),
(1, 210),
(1, 211),
(1, 212),
(1, 213),
(1, 214),
(1, 215),
(1, 216),
(1, 217),
(1, 218),
(1, 219),
(1, 220),
(1, 221),
(1, 222),
(1, 223),
(1, 224),
(1, 225),
(1, 226),
(1, 227),
(1, 228),
(1, 229),
(1, 230),
(1, 231),
(1, 232),
(1, 233),
(1, 234),
(1, 235),
(1, 236),
(1, 237),
(1, 238),
(1, 239),
(1, 240),
(1, 241),
(1, 242),
(1, 243),
(1, 244),
(1, 245),
(1, 246),
(1, 247),
(1, 248),
(1, 249),
(1, 250),
(1, 251),
(1, 252),
(1, 253),
(1, 254),
(1, 255),
(1, 256),
(1, 257),
(1, 258),
(1, 259),
(1, 260),
(1, 261),
(1, 262),
(1, 263),
(1, 264),
(1, 265),
(1, 266),
(1, 267),
(1, 268),
(1, 269),
(1, 270);

# this shows how to aggregate per day first and then union across days
set result_sketch = (
  with daily_agg as (
    select day, `$BQ_DATASET`.tuple_sketch_int64_agg_int64_lgk_seed_p_mode(id, 1, struct<int, int, float64, string>(8, null, null, "ONE")) as sketch from raw_data group by day
  )
  select `$BQ_DATASET`.tuple_sketch_int64_agg_union_lgk_seed_mode(sketch, struct<int, int, string>(8, null, "SUM")) as sketch from daily_agg
);

# engagement histogram with bounds
select
  n as days_visited,
  `$BQ_DATASET`.tuple_sketch_int64_get_estimate_and_bounds(`$BQ_DATASET`.tuple_sketch_int64_filter_low_high(result_sketch, n, n), 2) as visitors
from unnest(generate_array(1, 30)) as n;

# total estimated number of visitors with bounds
select `$BQ_DATASET`.tuple_sketch_int64_get_estimate_and_bounds(result_sketch, 2);

# total estimated number of visits with bounds
select `$BQ_DATASET`.tuple_sketch_int64_get_sum_estimate_and_bounds(result_sketch, 2);
