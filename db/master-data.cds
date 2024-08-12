namespace com.sophistex.db.masterdata;
using { cuid, managed } from '@sap/cds/common';

entity Employees: cuid, managed {
    firstName: String(40) @title : '{i18n>first_name}';
    lastName: String(40) @title: '{i18n>last_name}';
    manager: Association to one Employees @title: 'Manager';
    email: String(100) @title : 'Email address';
    isArchived: Boolean @title : 'Locked';
}


entity Activity: cuid, managed {
    name: String(100) @title : 'Activity Name';
    description: String @title:  'Activity Description';
    isArchived: Boolean @title : 'Locked';
}

entity Media: cuid, managed {
    key assetType: String(2) @title: 'Asset Type' enum {
        employee = 'EM';
        activity = 'AM';
    };
    @Core.MediaType: 'mediaType'
    content: LargeBinary @title : 'Media content';
    @Core.IsMediaType: true
    mediaType: String @title: 'Media Type';
    fileName: String @title : 'File Name';
}