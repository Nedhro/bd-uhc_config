delete from account_account where 1=1;
delete from account_account_type where 1=1;
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (1, 1, 'Receivable', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'receivable');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (2, 1, 'Payable', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'payable');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (3, 1, 'Bank and Cash', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'liquidity');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (4, 1, 'Credit Card', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'liquidity');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (5, 1, 'Current Assets', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (6, 1, 'Non-current Assets', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (7, 1, 'Prepayments', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (8, 1, 'Fixed Assets', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (9, 1, 'Current Liabilities', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (10, 1, 'Non-current Liabilities', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (11, 1, 'Equity', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (12, 1, 'Current Year Earnings', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', true, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (13, 1, 'Other Income', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', false, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (14, 1, 'Income', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', false, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (15, 1, 'Depreciation', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', false, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (16, 1, 'Expenses', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', false, 'other');
INSERT INTO public.account_account_type (id, create_uid, name, write_uid, note, write_date, create_date, include_initial_balance, type) VALUES (17, 1, 'Cost of Revenue', 1, null, '2019-03-20 06:39:13.995111', '2019-03-20 06:39:13.995111', false, 'other');
delete from account_account where 1=1;

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110001,    6,  'Building',                                 1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110002,    6,  'Equipments',                               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110003,    6,  'Furnitures & Fixtures',                    1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110004,    6,  'Vehicles',                                 1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120101,    5,  'Loan To Staff',                            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120102,    5,  'Loan To Staff - Motorcycle',               1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120201,    7,  'Advance To Employee',                      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120202,    7,  'Advance Office Rent',                      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120203,    7,  'Advance Against Salary',                   1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120204,    7,  'Advance To Others',                        1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120301,    1,  'Receivables from Patients',                1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120302,    1,  'Receivables from Machine Sales',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120303,    1,  'Other Receivables',                        1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120401,    5,  'Optical Frame',                            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120402,    5,  'Medicine',                                 1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120501,    3,  'Cash in Hand',                             1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120502,    3,  'Cash at Bank',                             1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130101,    10, 'Capital Fund',                             1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130202,    10, 'Reserve',                                  1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130301,    10, 'Loan - SOF',                               1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130401,    10, 'Staff Security Fund',                      1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130501,    15, 'Accumulated Depreciation - Furniture',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130502,    15, 'Accumulated Depreciation - Equipments',    1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130503,    15, 'Accumulated Depreciation - Vehicles',      1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140101,    9,  'Loan With SOF',                            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140102,    9,  'Loan With MF',                             1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140201,    9,  'Loan From Bank',                           1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140301,    2,  'VAT Procurement',                          1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140302,    2,  'Staff Income Tax',                         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140303,    2,  'Office Rent Tax',                          1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140401,    16, 'Provisions for Salary',                    1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140402,    16, 'Provisions for Repair & Maintenenace',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140403,    16, 'Provisions for Cleaning Materials',        1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210101,    17, 'Revenue From Obs & Gyane',                 1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210201,    17, 'Revenue From NICU',                        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210301,    17, 'Revenue From Pediatric',                   1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210401,    17, 'Revenue From Dental',                      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210501,    17, 'Revenue From Eye',                         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210601,    17, 'Revenue From Medicine',                    1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210701,    17, 'Revenue From ENT',                         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210801,    17, 'Revenue From Skin',                        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210901,    17, 'Revenue From Orthopedic',                  1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211001,    17, 'Revenue From Pathology',                   1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211101,    17, 'Revenue From Blood Bank',                  1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211201,    17, 'Revenue From USG',                         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211301,    17, 'Revenue From X-RAY',                       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211401,    17, 'Revenue From X-ECG',                       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211501,    17, 'Revenue From X-ECHO',                      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211601,    17, 'Revenue From Physiotherapy',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211701,    17, 'Revenue From Emergency',                   1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211801,    17, 'Revenue From General Surgery',             1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211901,    17, 'Revenue From Ambulance Service',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (212001,    17, 'Revenue From Canteen',                     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (212101,    17, 'Revenue From Non-Operational Activities',  1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220101,    16, 'Salary & Benefits of Obs & Gyane',         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220102,    16, 'Salary & Benefits of NICU',                1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220103,    16, 'Salary & Benefits of Pediatric',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220104,    16, 'Salary & Benefits of Dental',              1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220105,    16, 'Salary & Benefits of Eye',                 1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220106,    16, 'Salary & Benefits of Medicine',            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220107,    16, 'Salary & Benefits of ENT',                 1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220108,    16, 'Salary & Benefits of Skin',                1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220109,    16, 'Salary & Benefits of Orthopedic',          1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220110,    16, 'Salary & Benefits of Pathology/Lab',       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220111,    16, 'Salary & Benefits of Blood Bank',          1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220112,    16, 'Salary & Benefits of USG',                 1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220113,    16, 'Salary & Benefits of X-RAY',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220114,    16, 'Salary & Benefits of ECG',                 1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220115,    16, 'Salary & Benefits of ECHO',                1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220116,    16, 'Salary & Benefits of Physiotherapy',       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220117,    16, 'Salary & Benefits of Emergency',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220118,    16, 'Salary & Benefits of General Surgery',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220119,    16, 'Salary & Benefits of Canteen',             1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220201,    16, 'Consultants Payment of Obs & Gyane',       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220202,    16, 'Consultants Payment of NICU',              1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220203,    16, 'Consultants Payment of Pediatric',         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220204,    16, 'Consultants Payment of Dental',            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220205,    16, 'Consultants Payment of Eye',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220206,    16, 'Consultants Payment of Medicine',          1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220207,    16, 'Consultants Payment of ENT',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220208,    16, 'Consultants Payment of Skin',              1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220209,    16, 'Consultants Payment of Orthopedic',        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220210,    16, 'Consultants Payment of Pathology/Lab',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220211,    16, 'Consultants Payment of Blood Bank',        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220212,    16, 'Consultants Payment of USG',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220213,    16, 'Consultants Payment of X-RAY',             1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220214,    16, 'Consultants Payment of ECG',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220215,    16, 'Consultants Payment of ECHO',              1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220216,    16, 'Consultants Payment of Physiotherapy',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220217,    16, 'Consultants Payment of Emergency',         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220218,    16, 'Consultants Payment of General Surgery',   1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220301,    16, 'Medicine & Consumables of Obs & Gyane',    1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220302,    16, 'Medicine & Consumables of NICU',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220303,    16, 'Medicine & Consumables of Pediatric',      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220304,    16, 'Medicine & Consumables of Dental',         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220305,    16, 'Medicine & Consumables of Eye',            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220306,    16, 'Medicine & Consumables of Medicine',       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220307,    16, 'Medicine & Consumables of ENT',            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220308,    16, 'Medicine & Consumables of Skin',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220309,    16, 'Medicine & Consumables of Orthopedic',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220310,    16, 'Medicine & Consumables of Pathology/Lab',  1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220311,    16, 'Medicine & Consumables of Blood Bank',     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220312,    16, 'Medicine & Consumables of USG',            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220313,    16, 'Medicine & Consumables of X-RAY',          1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220314,    16, 'Medicine & Consumables of ECG',            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220315,    16, 'Medicine & Consumables of ECHO',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220316,    16, 'Medicine & Consumables of Physiotherapy',  1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220317,    16, 'Medicine & Consumables of Emergency',      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220318,    16, 'Medicine & Consumables of General Surgery',1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220401,    16, 'Cost of Food of Canteen',                  1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220501,    16, 'Canteen Materials',                        1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230101,    16, 'Salary & Benefits',                        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230102,    16, 'Rent & Utilities',                         1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230103,    16, 'Depreciation',                             1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230104,    16, 'Fuel & Lubricants',                        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230105,    16, 'Repair & Maintenance',                     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230106,    16, 'Advertising Expenses',                     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230107,    16, 'Cleaning Materials',                       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230108,    16, 'Travelling & Transportation',              1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230109,    16, 'Entertainment',                            1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230110,    16, 'Uniform, Curtain & Bedding',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230111,    16, 'Printing & Office Stationaries',           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230112,    16, 'Computer Accessories',                     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230113,    16, 'Legal & Other Fees',                       1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230114,    16, 'Data & Communication',                     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230115,    16, 'Medical Accessories',                      1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230116,    16, 'Staff Capacity Development',               1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230117,    16, 'Other Expenses',                           1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230118,    16, 'Audit & Consultancy',                      1,  'other');