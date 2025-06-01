@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_Project
  as select from I_EnterpriseProject as _EnterpriseProject

  association [0..*] to ZI_CLP_IE_Workpackage      as _Workpackage                 on  _Workpackage.ProjectUUID = _EnterpriseProject.ProjectUUID
  association [0..*] to ZI_CLP_ProjectTimeEntry as _ProjectTimeEntry            on  _ProjectTimeEntry.Project = _EnterpriseProject.Project

  association [1..1] to I_BusinessPartner       as _BusinessPartner             on  _BusinessPartner.BusinessPartnerUUID = _EnterpriseProject.CustomerUUID
  association [0..1] to ZI_CLP_PROJECTTEAMROLE  as _EnterpriseProjectManager    on  _EnterpriseProjectManager.ProjectUUID     = _EnterpriseProject.ProjectUUID
                                                                                and _EnterpriseProjectManager.ProjectRoleType = 'YP_RL_0001'
  association [0..1] to ZI_CLP_PROJECTTEAMROLE  as _EnterpriseProjectEngManager on  _EnterpriseProjectEngManager.ProjectUUID     = _EnterpriseProject.ProjectUUID
                                                                                and _EnterpriseProjectEngManager.ProjectRoleType = '0SAP_RL_005'
  association [0..1] to ZI_CLP_PROJECTTEAMROLE  as _EnterpriseProjectBiller     on  _EnterpriseProjectBiller.ProjectUUID     = _EnterpriseProject.ProjectUUID
                                                                                and _EnterpriseProjectBiller.ProjectRoleType = '0SAP_RL_006'
  association [0..1] to ZI_CLP_PROJECTTEAMROLE  as _EnterpriseProjectEngPartner on  _EnterpriseProjectEngPartner.ProjectUUID     = _EnterpriseProject.ProjectUUID
                                                                                and _EnterpriseProjectEngPartner.ProjectRoleType = '0SAP_RL_007'
                                                                                
  association [0..1] to I_CustProjSlsOrd  as _CustProjSlsOrd on  _CustProjSlsOrd.CustomerProject     = _EnterpriseProject.Project                                                                        
{

  key _EnterpriseProject.Project                                        as ProjectID,
      _EnterpriseProject.ProjectUUID,
      _EnterpriseProject.ProjectInternalID,
      _EnterpriseProject.CustomerUUID,
      _EnterpriseProject.EnterpriseProjectServiceOrg,
      _EnterpriseProject.EntProjectIsConfidential,
      _EnterpriseProject.RestrictedTimePosting,
      _EnterpriseProject.ProjectCategory,
      _EnterpriseProject.ProjectSummaryTaskUUID,
      _EnterpriseProject.Project,
      _EnterpriseProject.ProjectDescription,
      _EnterpriseProject.ProcessingStatus,
      _EnterpriseProject.PlannedStartDate,
      _EnterpriseProject.PlannedEndDate,
      _EnterpriseProject.ActualStartDate,
      _EnterpriseProject.ActualFinishDate,
      _EnterpriseProject.PriorityCode,
      _EnterpriseProject.EntProjIsMultiSlsOrdItmsEnbld,
      _EnterpriseProject.ProjectStartDate,
      _EnterpriseProject.ProjectEndDate,
      _EnterpriseProject.WBSElementInternalID,
      _EnterpriseProject.ProjectProfileCode,
      _EnterpriseProject.ProfitCenter,
      _EnterpriseProject.CompanyCode,
      _EnterpriseProject.ControllingArea,
      _EnterpriseProject.FunctionalArea,
      _EnterpriseProject.Location,
      _EnterpriseProject.Plant,
      _EnterpriseProject.Currency,
      _EnterpriseProject.AvailabilityControlProfile,
      _EnterpriseProject.AvailabilityControlIsActive,
      _EnterpriseProject.InvestmentProfile,
      _EnterpriseProject.TaxJurisdiction,
      _EnterpriseProject.EnterpriseProjectType,
      _EnterpriseProject.ResponsibleCostCenter,
      //      _EnterpriseProject.FunctionalLocation,
      _EnterpriseProject.IsBillingRelevant,
      _EnterpriseProject.ResultAnalysisInternalID,
      _EnterpriseProject.LeadingSalesOrder,
      _EnterpriseProject.LeadingSalesOrderItem,
      _EnterpriseProject.CreatedByUser,
      _EnterpriseProject.CreationDateTime,
      _EnterpriseProject.LastChangedByUser,
      _EnterpriseProject.LastChangeDateTime,
      _EnterpriseProject.ProjectLastChangedByUser,
      _EnterpriseProject.ProjectLastChangedDateTime,
      _EnterpriseProject.YY1_Value5_Cpr,
      _EnterpriseProject.YY1_HideAdminFee1_Cpr,
      _EnterpriseProject.YY1_ConsolidateAdminis_Cpr,
      _EnterpriseProject.YY1_NoOA_Cpr,
      _EnterpriseProject.YY1_ShowPage2_Cpr,
      _EnterpriseProject.YY1_BdgProjRealizPerc_Cpr, 
      _EnterpriseProject.YY1_AdminChargePerc_Cpr,       
      @EndUserText.label: 'Project Manager TeamMember UUID'
      _EnterpriseProjectManager.TeamMemberUUID                          as ManagerTeamMemberUUID,
      @EndUserText.label: 'Project Manager Personnel Nummber'
      _EnterpriseProjectManager.PersonWorkAgreement                     as ManagerPersonWorkAgreement,
      @EndUserText.label: 'Project Manager Work Agreement ExtID'
      _EnterpriseProjectManager.PersonWorkAgreementExternalID           as ManagerPersonWorkAgrExtID,
      @EndUserText.label: 'Project Manager Email Address'
      _EnterpriseProjectManager.EmailAddress                            as ManagerEmailAddress,
      @EndUserText.label: 'Project Manager FullName'
      _EnterpriseProjectManager.PersonFullName                          as ManagerPersonFullName,
      @EndUserText.label: 'Project Manager BP ID'
      _EnterpriseProjectManager.BusinessPartner                         as ManagerBP,
      @EndUserText.label: 'Project Manager BP UUID'
      _EnterpriseProjectManager.BusinessPartnerUUID                     as ManagerBPUUID,

      @EndUserText.label: 'EngManager TeamMember UUID'
      _EnterpriseProjectEngManager.TeamMemberUUID                       as EngManagerTeamMemberUUID,
      @EndUserText.label: 'EngManager Personnel Nummber'
      _EnterpriseProjectEngManager.PersonWorkAgreement                  as EngManagerPersonWorkAgreement,
      @EndUserText.label: 'Biller Work Agreement ExtID'
      _EnterpriseProjectEngManager.PersonWorkAgreementExternalID        as EngManagerPersonWorkAgrExtID,
      @EndUserText.label: 'Biller Email Address'
      _EnterpriseProjectEngManager.EmailAddress                         as EngManagerEmailAddress,
      @EndUserText.label: 'EngManager FullName'
      _EnterpriseProjectEngManager.PersonFullName                       as EngManagerPersonFullName,
      @EndUserText.label: 'EngManager BP ID'
      _EnterpriseProjectEngManager.BusinessPartner                      as EngManagerBP,
      @EndUserText.label: 'EngManager BP UUID'
      _EnterpriseProjectEngManager.BusinessPartnerUUID                  as EngManagerBPUUID,

      @EndUserText.label: 'Biller TeamMember UUID'
      _EnterpriseProjectBiller.TeamMemberUUID                           as BillerTeamMemberUUID,
      @EndUserText.label: 'Manager Personnel Nummber'
      _EnterpriseProjectBiller.PersonWorkAgreement                      as BillerPersonWorkAgreement,
      @EndUserText.label: 'Biller Work Agreement ExtID'
      _EnterpriseProjectBiller.PersonWorkAgreementExternalID            as BillerPersonWorkAgrExtID,
      @EndUserText.label: 'Biller Email Address'
      _EnterpriseProjectBiller.EmailAddress                             as BillerEmailAddress,
      @EndUserText.label: 'Biller FullName'
      _EnterpriseProjectBiller.PersonFullName                           as BillerPersonFullName,
      @EndUserText.label: 'Biller BP ID'
      _EnterpriseProjectBiller.BusinessPartner                          as BillerBP,
      @EndUserText.label: 'Biller BP UUID'
      _EnterpriseProjectBiller.BusinessPartnerUUID                      as BillerBPUUID,

      @EndUserText.label: 'EngPartner TeamMember UUID'
      _EnterpriseProjectEngPartner.TeamMemberUUID                       as EngPartnerTeamMemberUUID,
      @EndUserText.label: 'Manager Personnel Nummber'
      _EnterpriseProjectEngPartner.PersonWorkAgreement                  as EngPartnerPersonWorkAgreement,
      @EndUserText.label: 'EngPartner Work Agreement ExtID'
      _EnterpriseProjectEngPartner.PersonWorkAgreementExternalID        as EngPartnerPersonWorkAgrExtID,
      @EndUserText.label: 'EngPartner Email Address'
      _EnterpriseProjectEngPartner.EmailAddress                         as EngPartnerEmailAddress,
      @EndUserText.label: 'EngPartner FullName'
      _EnterpriseProjectEngPartner.PersonFullName                       as EngPartnerPersonFullName,
      @EndUserText.label: 'EngPartner BP ID'
      _EnterpriseProjectEngPartner.BusinessPartner                      as EngPartnerBP,
      @EndUserText.label: 'EngPartner BP UUID'
      _EnterpriseProjectEngPartner.BusinessPartnerUUID                  as EngPartnerBPUUID,
      _BusinessPartner.BusinessPartner                                  as Customer,
      _BusinessPartner.BusinessPartnerName                              as CustomerName,
//      _BusinessUserBasic._AddrCurDefaultEmailAddress.EmailAddress as CustomerEmailAddress,
      _BusinessPartner.IndependentAddressID,
      _BusinessPartner._CurrentDefaultAddress.AddressID,      
      _BusinessPartner._CurrentDefaultAddress._AddressDefaultRepresentation,
      _CustProjSlsOrd.SalesOrder,
//      _CustProjSlsOrd._SalesOrder._PricingElement.ConditionRecord,
      
//      _SalesDocumentPricingElement.ConditionRecord, 
//      _SalesDocumentPricingElement.ConditionRateRatio, 

      /* Associations */
      _EnterpriseProject._AuthGroup,
      _EnterpriseProject._AuthRole,
      _EnterpriseProject._AuthSubst,
      _EnterpriseProject._AuthUser,
      _EnterpriseProject._EnterpriseProjectForUser,
      _EnterpriseProject._EntProjProjectRespPersn,
      _EnterpriseProject._ProjectElement,
      _EnterpriseProject._ProjectRole,
      _EnterpriseProject._ProjectTeamMember,
      _Workpackage,
      _ProjectTimeEntry,

      _BusinessPartner._CurrentDefaultAddress,
      _BusinessPartner._BPAddressIndependentEmail
}
