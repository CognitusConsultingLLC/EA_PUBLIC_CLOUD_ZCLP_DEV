@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unique Work Packages for Billing Doc'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_IM_UniqueBDWorkPackage as select from ZI_CLP_BillingDoctItemBasic
{
    key BillingDocument,
    
      @EndUserText.label: 'Work Package'
    key ProjectElement,
      @EndUserText.label: 'WP Description'
        ProjectElementDescription
}group by BillingDocument,
          ProjectElement,
          ProjectElementDescription
