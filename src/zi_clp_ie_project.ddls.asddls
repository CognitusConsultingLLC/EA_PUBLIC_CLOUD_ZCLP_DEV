@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Project for Invoice Editor'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CLP_IE_Project
  as select from ZI_CLP_Project as _CLP_Project
  composition [0..*] of ZI_CLP_IE_ProjectTimeEntry    as _TimeEntries
  composition [0..*] of ZI_CLP_IE_ProjectExpenses     as _Expenses
  association [0..*] to ZI_CLP_IE_MarkedWIP           as _MarkedWIP                  on  _MarkedWIP.ProjectID = $projection.ProjectID
  association [0..*] to ZI_CLP_IE_ProjectOnAccountInv as _OnAccountInvoices          on  _OnAccountInvoices.ProjectID = $projection.ProjectID
  association [0..1] to ZI_CLP_IE_ProjectTimeEntry_A  as _IE_ProjectTimeEntry_A      on  _IE_ProjectTimeEntry_A.ProjectID = $projection.ProjectID
  association [0..1] to ZI_CLP_IE_ProjectExpenses_A   as _IE_ProjectExpenses_A       on  _IE_ProjectExpenses_A.ProjectID = $projection.ProjectID
  association [0..*] to ZR_TCLP_WIPMARK               as _WipMark                    on  _WipMark.Project = $projection.ProjectID

  association [1..1] to I_BusinessUserBasic           as _BusinessUserBasic          on  _BusinessUserBasic.UserID = $projection.Customer
  association [0..1] to I_AddrCurDefaultEmailAddress  as _AddrCurDefaultEmailAddress on  _AddrCurDefaultEmailAddress.AddressID       = $projection.AddressID
                                                                                     and _AddrCurDefaultEmailAddress.AddressPersonID = ''
  //  association [1..1] to I_BPAddressIndependentEmail   as _BPAddressIndependentEmail2 on  _BPAddressIndependentEmail2.BusinessPartner       = $projection.Customer
  //                                                                                     and _BPAddressIndependentEmail2.AddressID             = $projection.AddressID
  //                                                                                     and _BPAddressIndependentEmail2.IsDefaultEmailAddress = 'X'

  //  association [0..1] to I_BPCurrentDefaultAddress       as _BPCurrentDefaultAddress             on  _BPCurrentDefaultAddress.BusinessPartner = $projection.Customer
  
  
//  association [0..1] to I_SalesDocument as _SalesDocument            on  _SalesDocument.SalesDocument = $projection.SalesOrder  
  
  
  association [0..1] to I_SalesDocumentPricingElement as _SalesDocumentPricingElement            on  _SalesDocumentPricingElement.SalesDocument = $projection.SalesOrder  
                                                                                                 and _SalesDocumentPricingElement.ConditionType = 'ZDEV'
//                                                                                                 and _SalesDocumentPricingElement.PricingDateTime >= $session.system_date  
//                                                                                                 and _SalesDocumentPricingElement.PricingDateTime <= $session.system_date   

association [0..1] to ZI_CLP_IM_ProjectDevlBilling_A as _BillingDeliveredAggregation on _BillingDeliveredAggregation.ProjectID = _CLP_Project.ProjectID

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
      _AddrCurDefaultEmailAddress.EmailAddress            as CustomerEmailAddress,
      IndependentAddressID,
      _AddressDefaultRepresentation,
      AddressID,
      SalesOrder,
//      _SalesDocument._PricingElement[ConditionType = 'ZDEV'].ConditionRecord,
//      _SalesDocument._PricingElement[ConditionType = 'ZDEV'].ConditionRateRatio,
      _SalesDocumentPricingElement.ConditionRecord, 
      _SalesDocumentPricingElement.ConditionRateRatio, 
      @EndUserText.label: 'Open WIP'
      case
      when ( _IE_ProjectTimeEntry_A.SumOfOpenQuantity <> 0 or _IE_ProjectExpenses_A.SumOfOpenRevExpAmtInDocCrcy <> 0 ) then
      //      when ( _IE_ProjectTimeEntry_A.SumOfOpenQuantity <> 0 ) then
      cast('X' as boolean) else cast(' ' as boolean)
      end                                                 as OpenWIP,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _IE_ProjectTimeEntry_A.SumOfOpenRevTimeAmtInDocCrcy as OpenTime,
      @Semantics.amount.currencyCode: 'DocumentCurrency'
      _IE_ProjectExpenses_A.SumOfOpenRevExpAmtInDocCrcy   as OpenExpenses,
      _IE_ProjectTimeEntry_A.DocumentCurrency,
      0 as ZADM,
      0 as ZDEV,
      0 as CurrentRealization,
      
            @Semantics.amount.currencyCode: 'Currency'
      _BillingDeliveredAggregation.DeliveredBilling,
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
      _TimeEntries,
      _Expenses,
      _OnAccountInvoices,
      _MarkedWIP,
      _WipMark,
      _CurrentDefaultAddress,
      _BPAddressIndependentEmail

}
