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

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110001,    6,  'Building',                     1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110002,    6,  'Equipments',                   1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110003,    6,  'Furnitures & Fixtures',        1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110004,    6,  'Vehicles',                     1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120101,    5,  'Loan To Staff',                1,  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120102,    5,  'Loan To Staff - Motorcycle',   1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120201,    7,  'Advance To Employee',          1,  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120202,    1,  'Advance Office Rent',              1, 1100, 'current',                     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120203,1,                   'Advance Against Salary',           1,                   'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120204,1,                   'Advance To Others',                1,                        'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1203,   1,                  'Accounts Receivables',             1,                     'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120301,1,                   'Receivables from Patients',        1,                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120302,1,                   'Receivables from Machine Sales',   1,           'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120303,1,                   'Other Receivables',                1,                        'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1204,  1,                   'Inventories',                      1,                              'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120401,1,                   'Optical Frame',                    1,                            'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120402,1,                   'Medicine',                         1,                                 'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1205,  1,                   'Cash & Bank Balance',              1,                      'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120501,1,           'Cash in Hand', 1, 1, 1400, 'current',                            'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120502,1,           'Cash at Bank', 1, 1, 1400, 'current',                            'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (13,     1,                'Non Current Liabilities', 1, 1, 2, 'current',                    'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130101,1,           'Capital Fund', 1, 1, 2000, 'current',                            'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130202,1,           'Reserve', 1, 1, 2000, 'current',                                 'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1303,   1,             'Long Term Loan', 1, 1, 2000, 'current',                          'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130301,1,           'Loan - SOF', 1, 1, 2100, 'current',                              'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1304,   1,             'Long Term Liabilities', 1, 1, 2000, 'current',                    'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130401,1,           'Staff Security Fund', 1, 1, 2200, 'current',                     'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1305,   1,             'Accumulated Depreciation', 1, 1, 2000, 'current',                 'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130501,1,           'Accumulated Depreciation - Furniture', 1, 1, 2300, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130502,1,           'Accumulated Depreciation - Equipments', 1, 1, 2300, 'current',    'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (130503,1,           'Accumulated Depreciation - Vehicles', 1, 1, 2300, 'current',      'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (14,     1,               'Current Liabilities', 1, 1, 2, 'current',                         'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1401,   1,             'Inter Project Loan', 1, 1, 3000, 'current',                       'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140101,1,           'Loan With SOF', 1, 1, 3100, 'current',                            'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140102,1,           'Loan With MF', 1, 1, 3100, 'current',                             'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1402,   1,             'Short Term Bank Loan', 1, 1, 3000, 'current',                     'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140201,1,           'Loan From Bank', 1, 1, 3200, 'current',                           'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1403,   1,             'Accounts Payable', 1, 1, 3000, 'current',                         'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140301,1,           'VAT Procurement', 1, 1, 3300, 'current',                          'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140302,1,           'Staff Income Tax', 1, 1, 3300, 'current',                         'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140303,1,           'Office Rent Tax', 1, 1, 3300, 'current',                          'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (1404,   1,             'Provisions for Expenses', 1, 1, 3000, 'current',                  'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140401,1,           'Provisions for Salary', 1, 1, 3400, 'current',                    'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140402,1,           'Provisions for Repair & Maintenenace', 1, 1, 3400, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (140403,1,           'Provisions for Cleaning Materials', 1, 1, 3400, 'current',        'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (21,     1,                'Revenue', 1, 1, 3, 'current',                                     'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210101,1,           'Revenue From Obs & Gyane', 1, 1, 5001, 'current',                 'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210201,1,           'Revenue From NICU', 1, 1, 5001, 'current',                        'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210301,1,           'Revenue From Pediatric', 1, 1, 5001, 'current',                   'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210401,1,           'Revenue From Dental', 1, 1, 5001, 'current',                      'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210501,1,           'Revenue From Eye', 1, 1, 5001, 'current',                         'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210601,1,           'Revenue From Medicine', 1, 1, 5001, 'current',                    'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210701,1,           'Revenue From ENT', 1, 1, 5001, 'current',                         'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210801,1,           'Revenue From Skin', 1, 1, 5001, 'current',                        'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (210901,1,           'Revenue From Orthopedic', 1, 1, 5001, 'current',                  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211001,1,           'Revenue From Pathology', 1, 1, 5001, 'current',                   'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211101,1,           'Revenue From Blood Bank', 1, 1, 5001, 'current',                  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211201,1,           'Revenue From USG', 1, 1, 5001, 'current',                         'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211301,1,           'Revenue From X-RAY', 1, 1, 5001, 'current',                       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211401,1,           'Revenue From X-ECG', 1, 1, 5001, 'current',                       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211501,1,           'Revenue From X-ECHO', 1, 1, 5001, 'current',                      'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211601,1,           'Revenue From Physiotherapy', 1, 1, 5001, 'current',               'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211701,1,           'Revenue From Emergency', 1, 1, 5001, 'current',                   'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211801,1,           'Revenue From General Surgery', 1, 1, 5001, 'current',             'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (211901,1,           'Revenue From Ambulance Service', 1, 1, 5001, 'current',           'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (212001,1,           'Revenue From Canteen', 1, 1, 5001, 'current',                     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (212101,1,           'Revenue From Non-Operational Activities', 1, 1, 5001, 'current',  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (22,     1,                'Direct Expense', 1, 1, 3, 'current',                               'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (2201,   1,              'Salary & Benefits', 1, 1, 6001, 'current',                         'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220101,1,           'Salary & Benefits of Obs & Gyane',    1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220102,1,           'Salary & Benefits of NICU',           1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220103,1,           'Salary & Benefits of Pediatric',      1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220104,1,           'Salary & Benefits of Dental',         1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220105,1,           'Salary & Benefits of Eye',            1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220106,1,           'Salary & Benefits of Medicine',       1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220107,1,           'Salary & Benefits of ENT',            1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220108,1,           'Salary & Benefits of Skin',           1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220109,1,           'Salary & Benefits of Orthopedic',     1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220110,1,           'Salary & Benefits of Pathology/Lab',  1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220111,1,           'Salary & Benefits of Blood Bank',     1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220112,1,           'Salary & Benefits of USG',            1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220113,1,           'Salary & Benefits of X-RAY',          1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220114,1,           'Salary & Benefits of ECG',            1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220115,1,           'Salary & Benefits of ECHO',           1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220116,1,           'Salary & Benefits of Physiotherapy',  1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220117,1,           'Salary & Benefits of Emergency',      1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220118,1,           'Salary & Benefits of General Surgery',1, 1, 6101, 'current',       'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220119,1,           'Salary & Benefits of Canteen',        1, 1, 6101, 'current',       'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (2202,   1,            'Consultants Payment', 1, 1, 6001, 'current',                       'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220201,1,           'Consultants Payment of Obs & Gyane',    1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220202,1,           'Consultants Payment of NICU',           1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220203,1,           'Consultants Payment of Pediatric',      1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220204,1,           'Consultants Payment of Dental',         1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220205,1,           'Consultants Payment of Eye',            1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220206,1,           'Consultants Payment of Medicine',       1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220207,1,           'Consultants Payment of ENT',            1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220208,1,           'Consultants Payment of Skin',           1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220209,1,           'Consultants Payment of Orthopedic',     1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220210,1,           'Consultants Payment of Pathology/Lab',  1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220211,1,           'Consultants Payment of Blood Bank',     1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220212,1,           'Consultants Payment of USG',            1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220213,1,           'Consultants Payment of X-RAY',          1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220214,1,           'Consultants Payment of ECG',            1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220215,1,           'Consultants Payment of ECHO',           1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220216,1,           'Consultants Payment of Physiotherapy',  1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220217,1,           'Consultants Payment of Emergency',      1, 1, 6201, 'current',     'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220218,1,           'Consultants Payment of General Surgery',1, 1, 6201, 'current',     'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (2203,   1,             'Medicine & Consumables',                    1, 1, 6001, 'current',  'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220301,1,           'Medicine & Consumables of Obs & Gyane',     1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220302,1,           'Medicine & Consumables of NICU',            1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220303,1,           'Medicine & Consumables of Pediatric',       1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220304,1,           'Medicine & Consumables of Dental',          1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220305,1,           'Medicine & Consumables of Eye',             1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220306,1,           'Medicine & Consumables of Medicine',        1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220307,1,           'Medicine & Consumables of ENT',             1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220308,1,           'Medicine & Consumables of Skin',            1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220309,1,           'Medicine & Consumables of Orthopedic',      1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220310,1,           'Medicine & Consumables of Pathology/Lab',   1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220311,1,           'Medicine & Consumables of Blood Bank',      1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220312,1,           'Medicine & Consumables of USG',             1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220313,1,           'Medicine & Consumables of X-RAY',           1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220314,1,           'Medicine & Consumables of ECG',             1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220315,1,           'Medicine & Consumables of ECHO',            1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220316,1,           'Medicine & Consumables of Physiotherapy',   1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220317,1,           'Medicine & Consumables of Emergency',       1, 1, 6301, 'current',  'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220318,1,           'Medicine & Consumables of General Surgery', 1, 1, 6301, 'current',  'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220401,1,            'Cost of Food of Canteen', 1, 1, 6001, 'current',                    'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (220501,1,            'Canteen Materials', 1, 1, 6001, 'current',                          'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (23,     1,           'In Direct Expense',              1, 1, 3, 'current',                   'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (2301,   1,           'Hospital Overhead',              1, 1, 7001, 'current',                'view');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230101,1,           'Salary & Benefits',              1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230102,1,           'Rent & Utilities',               1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230103,1,           'Depreciation',                   1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230104,1,           'Fuel & Lubricants',              1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230105,1,           'Repair & Maintenance',           1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230106,1,           'Advertising Expenses',           1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230107,1,           'Cleaning Materials',             1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230108,1,           'Travelling & Transportation',    1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230109,1,           'Entertainment',                  1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230110,1,           'Uniform, Curtain & Bedding',     1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230111,1,           'Printing & Office Stationaries', 1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230112,1,           'Computer Accessories',           1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230113,1,           'Legal & Other Fees',             1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230114,1,           'Data & Communication',           1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230115,1,           'Medical Accessories',            1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230116,1,           'Staff Capacity Development',     1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230117,1,           'Other Expenses',                 1, 1, 7002, 'current',                'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (230118,1,           'Audit & Consultancy',            1, 1, 7002, 'current',                'other');
