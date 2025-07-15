@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project view of Project for Invoice Editor'
@Metadata.ignorePropagatedAnnotations: true
@Consumption.dbHints: ['USE_HEX_PLAN']
define root view entity ZC_CLP_IE_Project
  as projection on ZI_CLP_IE_Project  
//  association [0..1] to I_Address_2       as _Address_2             on  _Address_2.AddressID = $projection.AddressID
{
  key ProjectID,
      ProjectUUID,
      ProjectInternalID,
      CustomerUUID,
      EnterpriseProjectServiceOrg,
      EntProjectIsConfidential,
      RestrictedTimePosting,
      ProjectCategory,
      ProjectSummaryTaskUUID,
      Project,
      ProjectDescription,
      ProcessingStatus,
      PlannedStartDate,
      PlannedEndDate,
      ActualStartDate,
      ActualFinishDate,
      PriorityCode,
      EntProjIsMultiSlsOrdItmsEnbld,
      ProjectStartDate,
      ProjectEndDate,
      WBSElementInternalID,
      ProjectProfileCode,
      ProfitCenter,
      CompanyCode,
      ControllingArea,
      FunctionalArea,
      Location,
      Plant,
      Currency,
      AvailabilityControlProfile,
      AvailabilityControlIsActive,
      InvestmentProfile,
      TaxJurisdiction,
      EnterpriseProjectType,
      ResponsibleCostCenter,
      IsBillingRelevant,
      ResultAnalysisInternalID,
      LeadingSalesOrder,
      LeadingSalesOrderItem,
      CreatedByUser,
      CreationDateTime,
      LastChangedByUser,
      LastChangeDateTime,
      ProjectLastChangedByUser,
      ProjectLastChangedDateTime,
      YY1_Value5_Cpr,
      YY1_HideAdminFee1_Cpr,
      YY1_ConsolidateAdminis_Cpr,
      YY1_NoOA_Cpr,
      YY1_ShowPage2_Cpr,
      YY1_BdgProjRealizPerc_Cpr,
      YY1_AdminChargePerc_Cpr,
      ManagerTeamMemberUUID,
      ManagerPersonWorkAgreement,
      ManagerPersonWorkAgrExtID,
      ManagerEmailAddress,
      ManagerPersonFullName,
      ManagerBP,
      ManagerBPUUID,
      EngManagerTeamMemberUUID,
      EngManagerPersonWorkAgreement,
      EngManagerPersonWorkAgrExtID,
      EngManagerEmailAddress,
      EngManagerPersonFullName,
      EngManagerBP,
      EngManagerBPUUID,
      BillerTeamMemberUUID,
      BillerPersonWorkAgreement,
      BillerPersonWorkAgrExtID,
      BillerEmailAddress,
      BillerPersonFullName,
      BillerBP,
      BillerBPUUID,
      EngPartnerTeamMemberUUID,
      EngPartnerPersonWorkAgreement,
      EngPartnerPersonWorkAgrExtID,
      EngPartnerEmailAddress,
      EngPartnerPersonFullName,
      EngPartnerBP,
      EngPartnerBPUUID,
      Customer,
      CustomerName,
      CustomerEmailAddress,
      IndependentAddressID,
      AddressID,
      SalesOrder,
      ConditionRecord, 
      ConditionRateRatio,       
      @EndUserText.label: 'Open WIP'
      OpenWIP,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      OpenTime,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      OpenAdminFee,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      OpenExpenses,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      TotalWIP,
      DocumentCurrency,
      ZADM,
      ZDEV,
      CurrentRealization,
      @EndUserText.label: 'Previously Delivered Billing'
      @Semantics.amount.currencyCode: 'Currency'
      DeliveredBilling,
      @EndUserText.label: 'Billing Awaiting Delivery'
      @Semantics.amount.currencyCode: 'Currency'
      BillingAwaitDelv,
      @Semantics.amount.currencyCode: 'Currency'
      LTDBilledAmount,
       @Semantics.amount.currencyCode: 'Currency'
      LTDLabourCosts,
      
//      @Semantics.amount.currencyCode: 'Currency'
//      SumOpenAmountInTransCrcy,      
      
//       @Semantics.amount.currencyCode: 'Currency'
//      SumOriginalAmountInTransacCrcy,
      
//       @Semantics.amount.currencyCode: 'Currency'
//      SumOriginalAmountInProjectCrcy,
      
       @Semantics.amount.currencyCode: 'Currency'
      SumOriginalAmountInGlobalCrcy,
      
      /* Associations */
      _AuthGroup,
      _AuthRole,
      _AuthSubst,
      _AuthUser,
      _EnterpriseProjectForUser,
      _EntProjProjectRespPersn,
      _ProjectElement,
      _ProjectRole,
      _ProjectTeamMember,
      _Workpackage,
      _TimeEntries : redirected to ZC_CLP_IE_ProjectTimeEntry,
      _Expenses    : redirected to ZC_CLP_IE_ProjectExpenses,
      _OnAccountInvoices,
      _MarkedWIP,
      _WipMark,
      _CurrentDefaultAddress,
      _AddressDefaultRepresentation,
      _BPAddressIndependentEmail
}
