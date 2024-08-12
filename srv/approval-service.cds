using com.sophistex.db.tx as tx from '../db/transaction-data';
using com.sophistex.db.masterdata as md from '../db/master-data';

service approvalService @(
    path: 'odata/v4/timesheet/approvals',
    requires: 'authenticated-user'
) {
    entity TimesheetApproval @(
        restrict: [
            {
                grant: ['READ','UPDATE'],
                to: ['TimesheetManager']
            }
        ]
    ) 
    as projection on tx.Timesheet;

    @readonly entity Employees as projection on md.Employees;
    @readonly entity Activities as projection on md.Activity;
}