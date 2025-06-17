@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projects list for Invoice Manager'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CLP_IM_Project
  as select from ZI_CLP_Project as _CLP_Project

  association [0..*] to ZI_CLP_IM_Workpackage          as _Workpackage                 on _Workpackage.ProjectUUID = _CLP_Project.ProjectUUID
  association [0..1] to ZI_CLP_IM_ProjectInPrBilling_A as _BillingInprocessAggregation on _BillingInprocessAggregation.ProjectID = _CLP_Project.ProjectID
  association [0..1] to ZI_CLP_IM_ProjectOpenBilling_A as _BillingPlanItemAggregation  on _BillingPlanItemAggregation.CustomerProject = _CLP_Project.ProjectID
  association [0..1] to ZI_CLP_IM_ProjectDevlBilling_A as _BillingDeliveredAggregation on _BillingDeliveredAggregation.ProjectID = _CLP_Project.ProjectID
  composition [0..*] of ZI_CLP_IM_InvoicesInProcess    as _ScheduledInvoicesInProcess

  composition [0..*] of ZI_CLP_IM_UnbilledScheduledInv as _UnbilledScheduledInvoices

  composition [0..*] of ZI_CLP_IM_PreviousDelvInvoices as _PreviouslyDeliveredInvoices

{
  key _CLP_Project.ProjectID,
      _CLP_Project.ProjectUUID,
      _CLP_Project.ProjectInternalID,
      _CLP_Project.CustomerUUID,
      _CLP_Project.EnterpriseProjectServiceOrg,
      _CLP_Project.EntProjectIsConfidential,
      _CLP_Project.RestrictedTimePosting,
      _CLP_Project.ProjectCategory,
      _CLP_Project.ProjectSummaryTaskUUID,
      _CLP_Project.Project,
      _CLP_Project.ProjectDescription,
      _CLP_Project.ProcessingStatus,
      _CLP_Project.PlannedStartDate,
      _CLP_Project.PlannedEndDate,
      _CLP_Project.ActualStartDate,
      _CLP_Project.ActualFinishDate,
      _CLP_Project.PriorityCode,
      _CLP_Project.EntProjIsMultiSlsOrdItmsEnbld,
      _CLP_Project.ProjectStartDate,
      _CLP_Project.ProjectEndDate,
      _CLP_Project.WBSElementInternalID,
      _CLP_Project.ProjectProfileCode,
      _CLP_Project.ProfitCenter,
      _CLP_Project.CompanyCode,
      _CLP_Project.ControllingArea,
      _CLP_Project.FunctionalArea,
      _CLP_Project.Location,
      _CLP_Project.Plant,
      _CLP_Project.Currency,
      _CLP_Project.AvailabilityControlProfile,
      _CLP_Project.AvailabilityControlIsActive,
      _CLP_Project.InvestmentProfile,
      _CLP_Project.TaxJurisdiction,
      _CLP_Project.EnterpriseProjectType,
      _CLP_Project.ResponsibleCostCenter,
      _CLP_Project.IsBillingRelevant,
      _CLP_Project.ResultAnalysisInternalID,
      _CLP_Project.LeadingSalesOrder,
      _CLP_Project.LeadingSalesOrderItem,
      _CLP_Project.CreatedByUser,
      _CLP_Project.CreationDateTime,
      _CLP_Project.LastChangedByUser,
      _CLP_Project.LastChangeDateTime,
      _CLP_Project.ProjectLastChangedByUser,
      _CLP_Project.ProjectLastChangedDateTime,
      _CLP_Project.YY1_Value5_Cpr,
      _CLP_Project.YY1_HideAdminFee1_Cpr,
      _CLP_Project.YY1_ConsolidateAdminis_Cpr,
      _CLP_Project.YY1_NoOA_Cpr,
      _CLP_Project.YY1_ShowPage2_Cpr,
      _CLP_Project.YY1_AdminChargePerc_Cpr,
    _CLP_Project.ManagerTeamMemberUUID,
    _CLP_Project.ManagerPersonWorkAgreement,
    _CLP_Project.ManagerPersonWorkAgrExtID,
    _CLP_Project.ManagerEmailAddress,
    _CLP_Project.ManagerPersonFullName,
    _CLP_Project.ManagerBP,
    _CLP_Project.ManagerBPUUID,
    _CLP_Project.EngManagerTeamMemberUUID,
    _CLP_Project.EngManagerPersonWorkAgreement,
    _CLP_Project.EngManagerPersonWorkAgrExtID,
    _CLP_Project.EngManagerEmailAddress,
    _CLP_Project.EngManagerPersonFullName,
    _CLP_Project.EngManagerBP,
    _CLP_Project.EngManagerBPUUID,
    _CLP_Project.BillerTeamMemberUUID,
    _CLP_Project.BillerPersonWorkAgreement,
    _CLP_Project.BillerPersonWorkAgrExtID,
    _CLP_Project.BillerEmailAddress,
    _CLP_Project.BillerPersonFullName,
    _CLP_Project.BillerBP,
    _CLP_Project.BillerBPUUID,
    _CLP_Project.EngPartnerTeamMemberUUID,
    _CLP_Project.EngPartnerPersonWorkAgreement,
    _CLP_Project.EngPartnerPersonWorkAgrExtID,
    _CLP_Project.EngPartnerEmailAddress,
    _CLP_Project.EngPartnerPersonFullName,
    _CLP_Project.EngPartnerBP,
    _CLP_Project.EngPartnerBPUUID,

      _CLP_Project.Customer,
      _CLP_Project.CustomerName,
      _CLP_Project.IndependentAddressID,

      _BillingPlanItemAggregation.NextBillingDueDate,
      @Semantics.amount.currencyCode: 'Currency'
      _BillingPlanItemAggregation.OpenBilling,
      _BillingPlanItemAggregation.TransactionCurrency,

      @Semantics.amount.currencyCode: 'Currency'
      _BillingInprocessAggregation.InprocessBilling,

      @Semantics.amount.currencyCode: 'Currency'
      _BillingDeliveredAggregation.DeliveredBilling,

      /* Associations */
      _CLP_Project._AuthGroup,
      _CLP_Project._AuthRole,
      _CLP_Project._AuthSubst,
      _CLP_Project._AuthUser,
      _CLP_Project._EnterpriseProjectForUser,
      _CLP_Project._EntProjProjectRespPersn,
      _CLP_Project._ProjectElement,
      _CLP_Project._ProjectRole,
      _CLP_Project._ProjectTeamMember,
      _Workpackage,
      _CurrentDefaultAddress,
      _ScheduledInvoicesInProcess,
      _UnbilledScheduledInvoices,
      _PreviouslyDeliveredInvoices,
      _BillingPlanItemAggregation,
      _BillingInprocessAggregation,
      _BillingDeliveredAggregation,
      _BPAddressIndependentEmail
}
