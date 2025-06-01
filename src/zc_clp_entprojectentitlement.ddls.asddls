@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Project Entitlement'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZC_CLP_EntProjectEntitlement
  as select from I_EntProjectEntitlement as _EntProjectEntitlement
  association [0..1] to I_EnterpriseProjectTeamMember as _EnterpriseProjectTeamMember on _EnterpriseProjectTeamMember.TeamMemberUUID = _EntProjectEntitlement.TeamMemberUUID
  association [0..1] to I_EnterpriseProjectRole as _EnterpriseProjectRole on _EnterpriseProjectRole.ProjectRoleUUID = _EntProjectEntitlement.ProjectRoleUUID
  
{
  key _EntProjectEntitlement.ProjectUUID,
  key _EntProjectEntitlement.ProjectRoleUUID,
  key _EntProjectEntitlement.TeamMemberUUID,
      _EnterpriseProjectTeamMember.BusinessPartnerUUID,
//      _CLP_BPPersonExtID.BusinessPartner,
//      _CLP_BPPersonExtID.PersonWorkAgreement,
//      _CLP_BPPersonExtID.PersonWorkAgreementExternalID,
//      _CLP_BPPersonExtID.PersonFullName,
//      _CLP_BPPersonExtID.EmailAddress,
      _EnterpriseProjectRole.ProjectRoleType,
//      
      _EnterpriseProjectRole
//      _CLP_BPPersonExtID
}
