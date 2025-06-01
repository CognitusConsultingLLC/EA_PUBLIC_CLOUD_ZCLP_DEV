@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Project Team Role'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_PROJECTTEAMROLE
  as select from ZC_CLP_EntProjectEntitlement as _CLP_EntProjectEntitlement
//  association [0..1] to ZI_CLP_BPPersonExtID as _CLP_BPPersonExtID on _CLP_BPPersonExtID.BusinessPartnerUUID = _CLP_EntProjectEntitlement.BusinessPartnerUUID
association[0..1] to I_BusinessUserBasic as _BusinessPartner on _BusinessPartner.BusinessPartnerUUID = _CLP_EntProjectEntitlement.BusinessPartnerUUID
//association [1..1] to I_BusinessPartner       as _BusinessPartner             on  _BusinessPartner.BusinessPartnerUUID = _CLP_EntProjectEntitlement.BusinessPartnerUUID
  
{
  key _CLP_EntProjectEntitlement.ProjectUUID,
  key _CLP_EntProjectEntitlement.ProjectRoleUUID,
  key _CLP_EntProjectEntitlement.TeamMemberUUID,
      _CLP_EntProjectEntitlement.BusinessPartnerUUID,
      _BusinessPartner.BusinessPartner,
      '' as PersonWorkAgreement,
      _BusinessPartner._WorkplaceAddress.AddressID,
      '' as PersonWorkAgreementExternalID,
      _BusinessPartner.PersonFullName,
//      _BusinessPartner._CurrentDefaultAddress.EmailAddress,
      _BusinessPartner._User._AddrCurDefaultEmailAddress.EmailAddress as EmailAddress,
      _EnterpriseProjectRole.ProjectRoleType,
      
      _EnterpriseProjectRole,
      _BusinessPartner
}
