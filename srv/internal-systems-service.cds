using {sapjapan.internal.systems as my} from '../db/schema';

service InternalSystemService {
   entity Systems as projection on my.Systems;
};

annotate InternalSystemService.Systems with @(
   UI:{

      SelectionFields: [solution, host_name,sid,system_administrator],
      LineItem:[
         {$Type: 'UI.DataField',Value: solution},
         {$Type: 'UI.DataField',Value: host_name},
         {$Type: 'UI.DataField',Value: sid},
         {$Type: 'UI.DataField',Value: system_administrator}
      ],
      HeaderFacets: [       
         {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#SystemDetail'}
      ],
      Facets: [
         {
            $Type: 'UI.CollectionFacet',
            Label: 'System information',
            Facets: [
            {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Info'},
          ]
         },
         {
            $Type: 'UI.CollectionFacet',
            Label: 'Memo / Description for this system',
            Facets: [
            {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Description'},
          ]
         }
      ],
      FieldGroup#SystemDetail: {
         Data:[
            {$Type: 'UI.DataField', Value: sid},
            {$Type: 'UI.DataField', Value: solution}
         ]
      },
      FieldGroup#Info: {
         Data:[
            {$Type: 'UI.DataField', Value: host_name},
            {$Type: 'UI.DataField', Value: ip_address},
            {$Type: 'UI.DataField', Value: instance_num},
            {$Type: 'UI.DataField', Value: web_url},
            {$Type: 'UI.DataField', Value: system_administrator},
            {$Type: 'UI.DataField', Value: user_info}
           
         ]
      },
      FieldGroup#Description: {
         Data: [
            {$Type: 'UI.DataField', Value: comment}
         ]
      }
   }
);

annotate InternalSystemService.Systems with {
   solution @(Common: {Label: 'Solution Name'} );
   host_name @(Common: {Label: 'Host Name'});
   ip_address @(Common: {Label: 'IP Address'});
   sid @(Common: {Label: 'SID'});
   instance_num  @(Common: {Label: 'Instance Number'});
   web_url  @(Common: {Label: 'URL for accessing'});
   system_administrator @(Common: {Label:'System Administrator'});
   user_info  @(Common: {Label: 'User and Password'});
   comment  @(Common: {Label: 'Comment on this system'});
};