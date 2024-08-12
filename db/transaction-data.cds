namespace com.sophistex.db.tx;
using { cuid, managed, sap.common.CodeList as CodeList } from '@sap/cds/common';
using com.sophistex.db.masterdata as md from './master-data';

entity Timesheet: cuid, managed {
    employeeId: Association to one md.Employees;
    managerId: Association to one md.Employees;
    year: String(4);
    month: String(2);
    status: String(2);
    entries: Composition of many TimesheetEntries on entries.parent = $self;
}

entity TimesheetEntries: cuid, managed {
    parent: Association to Timesheet;
    activity: Association to one md.Activity;
    hours: Double;
    remarks: String(100);
}


entity TimesheetStatus: CodeList {
    key status: String(10);
}