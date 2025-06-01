@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bill Doc Approval Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_DOCAPPROVALSTS_V
  as select from I_CustomFieldCodeListText
{
@ObjectModel.text.element: [ 'Code_Text' ]
  key Code,
      Description as Code_Text

}
where
      CustomFieldID = 'YY1_CLPDOCAPPROVALSTS'
  and Language      = $session.system_language
