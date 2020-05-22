using {sapjapan.internal.systems as my} from '../db/schema';

service InternalSystemService {
   entity Systems as projection on my.Systems;
};

annotate InternalSystemService.Systems with @(
   UI:{
      HeaderInfo: {
         TypeName: 'SAPJAPAN Platform Internal System',
         TypeNamePlural: 'Systems',
         Title: {$Type: 'UI.Datafield', Value: 'Internal System'}
      },
      SelectionFields: [solution, server_name,sid,system_administrator],
      LineItem:[
         {$Type: 'UI.DataField',Value: solution},
         {$Type: 'UI.DataField',Value: host_name},
         {$Type: 'UI.DataField',Value: sid},
         {$Type: 'UI.DataField',Value: system_administrator}
      ],
      HeaderFacets: [       
         {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#SystemDetail'}
      ],
      FieldGroup#SystemDetail: {
         Data:[
            {$Type: 'UI.DataField',Value: solution},
            {$Type: 'UI.DataField',Value: host_name},
            {$Type: 'UI.DataField',Value: ip_address},
            {$Type: 'UI.DataField',Value: sid},
            {$Type: 'UI.DataField',Value: instance_num},
            {$Type: 'UI.DataField',Value: web_url},
            {$Type: 'UI.DataField',Value: system_administrator},
            {$Type: 'UI.DataField',Value: user_info},
            {$Type: 'UI.DataField',Value: comment}
         ]
      }
   }
);

annotate InternalSystemService.Systems with {
   solution @(Common: {Label: 'Solution Name'} );
   host_name @(Common: {Label: 'Host Name / IP'});
   sid @(Common: {Label: 'SID'});
   system_administrator @(Common: {Label:'System Administrator'});
};