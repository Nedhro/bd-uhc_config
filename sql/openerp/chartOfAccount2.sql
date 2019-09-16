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

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110001,  6,  'Building',                    1, 'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110002,  6,  'Equipments',                  1, 'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110003,  6,  'Furnitures & Fixtures',       1, 'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (110004,  6,  'Vehicles',                    1, 'other');

insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120101, 5,  'Loan To Staff',                1, 'other');
insert into public.account_account (code, user_type_id, name, company_id, internal_type) values (120102, 5,  'Loan To Staff - Motorcycle',   1, 'other');





insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1100, 1202,   1,                  'Advances & Prepayments',           1, 1000, 'current',                  'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1101, 120201, 1,                  'Advance To Employee',              1, 1100, 'current',                     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1102, 120202,1,                   'Advance Office Rent',              1, 1100, 'current',                     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1103, 120203,1,                   'Advance Against Salary',           1, 1100, 'current',                  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1104, 120204,1,                   'Advance To Others',                1, 1100, 'current',                       'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1200, 1203,   1,                  'Accounts Receivables',             1, 1000, 'current',                    'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1201, 120301,1,                   'Receivables from Patients',        1, 1200, 'current',               'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1202, 120302,1,                   'Receivables from Machine Sales',   1, 1200, 'current',          'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1203, 120303,1,                   'Other Receivables',                1, 1200, 'current',                       'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1300, 1204,  1,                   'Inventories',                      1, 1000, 'current',                             'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1301, 120401,1,                   'Optical Frame',                    1, 1300, 'current',                           'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1302, 120402,1,                   'Medicine',                         1, 1300, 'current',                                'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1400, 1205,  1,                   'Cash & Bank Balance',              1, 1000, 'current',                     'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1401, 120501,1,           'Cash in Hand', 1, 1, 1400, 'current',                            'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (1402, 120502,1,           'Cash at Bank', 1, 1, 1400, 'current',                            'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2000, 13,     1,                'Non Current Liabilities', 1, 1, 2, 'current',                    'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2001, 130101,1,           'Capital Fund', 1, 1, 2000, 'current',                            'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2002, 130202,1,           'Reserve', 1, 1, 2000, 'current',                                 'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2100, 1303,   1,             'Long Term Loan', 1, 1, 2000, 'current',                          'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2101, 130301,1,           'Loan - SOF', 1, 1, 2100, 'current',                              'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2200, 1304,   1,             'Long Term Liabilities', 1, 1, 2000, 'current',                    'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2201, 130401,1,           'Staff Security Fund', 1, 1, 2200, 'current',                     'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2300, 1305,   1,             'Accumulated Depreciation', 1, 1, 2000, 'current',                 'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2301, 130501,1,           'Accumulated Depreciation - Furniture', 1, 1, 2300, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2302, 130502,1,           'Accumulated Depreciation - Equipments', 1, 1, 2300, 'current',    'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (2303, 130503,1,           'Accumulated Depreciation - Vehicles', 1, 1, 2300, 'current',      'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3000, 14,     1,               'Current Liabilities', 1, 1, 2, 'current',                         'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3100, 1401,   1,             'Inter Project Loan', 1, 1, 3000, 'current',                       'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3101, 140101,1,           'Loan With SOF', 1, 1, 3100, 'current',                            'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3102, 140102,1,           'Loan With MF', 1, 1, 3100, 'current',                             'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3200, 1402,   1,             'Short Term Bank Loan', 1, 1, 3000, 'current',                     'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3201, 140201,1,           'Loan From Bank', 1, 1, 3200, 'current',                           'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3300, 1403,   1,             'Accounts Payable', 1, 1, 3000, 'current',                         'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3301, 140301,1,           'VAT Procurement', 1, 1, 3300, 'current',                          'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3302, 140302,1,           'Staff Income Tax', 1, 1, 3300, 'current',                         'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3303, 140303,1,           'Office Rent Tax', 1, 1, 3300, 'current',                          'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3400, 1404,   1,             'Provisions for Expenses', 1, 1, 3000, 'current',                  'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3401, 140401,1,           'Provisions for Salary', 1, 1, 3400, 'current',                    'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3402, 140402,1,           'Provisions for Repair & Maintenenace', 1, 1, 3400, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (3403, 140403,1,           'Provisions for Cleaning Materials', 1, 1, 3400, 'current',        'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5001, 21,     1,                'Revenue', 1, 1, 3, 'current',                                     'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5002, 210101,1,           'Revenue From Obs & Gyane', 1, 1, 5001, 'current',                 'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5003, 210201,1,           'Revenue From NICU', 1, 1, 5001, 'current',                        'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5004, 210301,1,           'Revenue From Pediatric', 1, 1, 5001, 'current',                   'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5005, 210401,1,           'Revenue From Dental', 1, 1, 5001, 'current',                      'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5006, 210501,1,           'Revenue From Eye', 1, 1, 5001, 'current',                         'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5007, 210601,1,           'Revenue From Medicine', 1, 1, 5001, 'current',                    'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5008, 210701,1,           'Revenue From ENT', 1, 1, 5001, 'current',                         'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5009, 210801,1,           'Revenue From Skin', 1, 1, 5001, 'current',                        'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5010, 210901,1,           'Revenue From Orthopedic', 1, 1, 5001, 'current',                  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5011, 211001,1,           'Revenue From Pathology', 1, 1, 5001, 'current',                   'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5012, 211101,1,           'Revenue From Blood Bank', 1, 1, 5001, 'current',                  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5013, 211201,1,           'Revenue From USG', 1, 1, 5001, 'current',                         'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5014, 211301,1,           'Revenue From X-RAY', 1, 1, 5001, 'current',                       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5015, 211401,1,           'Revenue From X-ECG', 1, 1, 5001, 'current',                       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5016, 211501,1,           'Revenue From X-ECHO', 1, 1, 5001, 'current',                      'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5017, 211601,1,           'Revenue From Physiotherapy', 1, 1, 5001, 'current',               'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5018, 211701,1,           'Revenue From Emergency', 1, 1, 5001, 'current',                   'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5019, 211801,1,           'Revenue From General Surgery', 1, 1, 5001, 'current',             'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5020, 211901,1,           'Revenue From Ambulance Service', 1, 1, 5001, 'current',           'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5021, 212001,1,           'Revenue From Canteen', 1, 1, 5001, 'current',                     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (5022, 212101,1,           'Revenue From Non-Operational Activities', 1, 1, 5001, 'current',  'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6001, 22,     1,                'Direct Expense', 1, 1, 3, 'current',                               'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6101, 2201,   1,              'Salary & Benefits', 1, 1, 6001, 'current',                         'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6102, 220101,1,           'Salary & Benefits of Obs & Gyane',    1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6103, 220102,1,           'Salary & Benefits of NICU',           1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6104, 220103,1,           'Salary & Benefits of Pediatric',      1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6105, 220104,1,           'Salary & Benefits of Dental',         1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6106, 220105,1,           'Salary & Benefits of Eye',            1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6107, 220106,1,           'Salary & Benefits of Medicine',       1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6108, 220107,1,           'Salary & Benefits of ENT',            1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6109, 220108,1,           'Salary & Benefits of Skin',           1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6110, 220109,1,           'Salary & Benefits of Orthopedic',     1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6111, 220110,1,           'Salary & Benefits of Pathology/Lab',  1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6112, 220111,1,           'Salary & Benefits of Blood Bank',     1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6113, 220112,1,           'Salary & Benefits of USG',            1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6114, 220113,1,           'Salary & Benefits of X-RAY',          1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6115, 220114,1,           'Salary & Benefits of ECG',            1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6116, 220115,1,           'Salary & Benefits of ECHO',           1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6117, 220116,1,           'Salary & Benefits of Physiotherapy',  1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6118, 220117,1,           'Salary & Benefits of Emergency',      1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6119, 220118,1,           'Salary & Benefits of General Surgery',1, 1, 6101, 'current',       'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6120, 220119,1,           'Salary & Benefits of Canteen',        1, 1, 6101, 'current',       'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6201, 2202,   1,            'Consultants Payment', 1, 1, 6001, 'current',                       'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6202, 220201,1,           'Consultants Payment of Obs & Gyane',    1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6203, 220202,1,           'Consultants Payment of NICU',           1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6204, 220203,1,           'Consultants Payment of Pediatric',      1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6205, 220204,1,           'Consultants Payment of Dental',         1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6206, 220205,1,           'Consultants Payment of Eye',            1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6207, 220206,1,           'Consultants Payment of Medicine',       1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6208, 220207,1,           'Consultants Payment of ENT',            1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6209, 220208,1,           'Consultants Payment of Skin',           1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6210, 220209,1,           'Consultants Payment of Orthopedic',     1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6211, 220210,1,           'Consultants Payment of Pathology/Lab',  1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6212, 220211,1,           'Consultants Payment of Blood Bank',     1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6213, 220212,1,           'Consultants Payment of USG',            1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6214, 220213,1,           'Consultants Payment of X-RAY',          1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6215, 220214,1,           'Consultants Payment of ECG',            1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6216, 220215,1,           'Consultants Payment of ECHO',           1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6217, 220216,1,           'Consultants Payment of Physiotherapy',  1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6218, 220217,1,           'Consultants Payment of Emergency',      1, 1, 6201, 'current',     'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6219, 220218,1,           'Consultants Payment of General Surgery',1, 1, 6201, 'current',     'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6301, 2203,   1,             'Medicine & Consumables',                    1, 1, 6001, 'current',  'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6302, 220301,1,           'Medicine & Consumables of Obs & Gyane',     1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6303, 220302,1,           'Medicine & Consumables of NICU',            1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6304, 220303,1,           'Medicine & Consumables of Pediatric',       1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6305, 220304,1,           'Medicine & Consumables of Dental',          1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6306, 220305,1,           'Medicine & Consumables of Eye',             1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6307, 220306,1,           'Medicine & Consumables of Medicine',        1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6308, 220307,1,           'Medicine & Consumables of ENT',             1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6309, 220308,1,           'Medicine & Consumables of Skin',            1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6310, 220309,1,           'Medicine & Consumables of Orthopedic',      1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6311, 220310,1,           'Medicine & Consumables of Pathology/Lab',   1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6312, 220311,1,           'Medicine & Consumables of Blood Bank',      1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6313, 220312,1,           'Medicine & Consumables of USG',             1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6314, 220313,1,           'Medicine & Consumables of X-RAY',           1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6315, 220314,1,           'Medicine & Consumables of ECG',             1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6316, 220315,1,           'Medicine & Consumables of ECHO',            1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6317, 220316,1,           'Medicine & Consumables of Physiotherapy',   1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6318, 220317,1,           'Medicine & Consumables of Emergency',       1, 1, 6301, 'current',  'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6319, 220318,1,           'Medicine & Consumables of General Surgery', 1, 1, 6301, 'current',  'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6400, 220401,1,            'Cost of Food of Canteen', 1, 1, 6001, 'current',                    'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (6401, 220501,1,            'Canteen Materials', 1, 1, 6001, 'current',                          'other');

insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7001, 23,     1,           'In Direct Expense',              1, 1, 3, 'current',                   'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7002, 2301,   1,           'Hospital Overhead',              1, 1, 7001, 'current',                'view');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7003, 230101,1,           'Salary & Benefits',              1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7004, 230102,1,           'Rent & Utilities',               1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7005, 230103,1,           'Depreciation',                   1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7006, 230104,1,           'Fuel & Lubricants',              1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7007, 230105,1,           'Repair & Maintenance',           1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7008, 230106,1,           'Advertising Expenses',           1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7009, 230107,1,           'Cleaning Materials',             1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7010, 230108,1,           'Travelling & Transportation',    1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7011, 230109,1,           'Entertainment',                  1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7012, 230110,1,           'Uniform, Curtain & Bedding',     1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7013, 230111,1,           'Printing & Office Stationaries', 1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7014, 230112,1,           'Computer Accessories',           1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7015, 230113,1,           'Legal & Other Fees',             1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7016, 230114,1,           'Data & Communication',           1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7017, 230115,1,           'Medical Accessories',            1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7018, 230116,1,           'Staff Capacity Development',     1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7019, 230117,1,           'Other Expenses',                 1, 1, 7002, 'current',                'other');
insert into public.account_account (id, code, user_type_id, name, company_id, internal_type) values (7020, 230118,1,           'Audit & Consultancy',            1, 1, 7002, 'current',                'other');
