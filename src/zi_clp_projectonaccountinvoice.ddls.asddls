@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'On Account Invoices for project'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_ProjectOnAccountInvoice
as select from I_BillingDocumentBasic as hdr
  
  inner join ZI_CLP_BillingDocsWSingleMat as agg
    on hdr.BillingDocument = agg.BillingDocument
    
    
  left outer join ZI_CLP_WIPMARK_BASIC as MarkedWIP
    on hdr.BillingDocument = MarkedWIP.Invoice
    and MarkedWIP.Status = 'M'
  
  left outer join ZI_CLP_IE_MarkedOA as MarkedOA
    on hdr.BillingDocument = MarkedOA.Invoice
    
//  left outer join ZI_CLP_WIPMARK_UniqueInv as MarkedWIP
//    on _ProjectOnAccountInvoice.BillingDocument = MarkedWIP.Invoice
{
  key hdr.BillingDocument,
      hdr.SDDocumentCategory,
      hdr.BillingDocumentCategory,
      hdr.BillingDocumentType,
      hdr.ProposedBillingDocumentType,
      hdr.CreatedByUser,
      hdr.CreationDate,
      hdr.CreationTime,
      hdr.LastChangeDate,
      hdr.LastChangeDateTime,
      hdr.LogicalSystem,
      hdr.SalesOrganization,
      hdr.DistributionChannel,
      hdr.Division,
      hdr.BillingDocumentDate,
      hdr.BillingDocumentIsCancelled,
      hdr.CancelledBillingDocument,
      hdr.BillingDocCombinationCriteria,
      hdr.ManualInvoiceMaintIsRelevant,
      hdr.NmbrOfPages,
      hdr.IsIntrastatReportingRelevant,
      hdr.IsIntrastatReportingExcluded,
      hdr.BillingDocumentIsTemporary,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      hdr.TotalNetAmount,
      hdr.TransactionCurrency,
      hdr.StatisticsCurrency,
      @Semantics.amount.currencyCode: 'TransactionCurrency'
    hdr.TotalTaxAmount,
    hdr.CustomerPriceGroup,
    hdr.PriceListType,
    hdr.TaxDepartureCountry,
    hdr.VATRegistration,
    hdr.VATRegistrationOrigin,
    hdr.VATRegistrationCountry,
    hdr.HierarchyTypePricing,
    hdr.CustomerTaxClassification1,
    hdr.CustomerTaxClassification2,
    hdr.CustomerTaxClassification3,
    hdr.CustomerTaxClassification4,
    hdr.CustomerTaxClassification5,
    hdr.CustomerTaxClassification6,
    hdr.CustomerTaxClassification7,
    hdr.CustomerTaxClassification8,
    hdr.CustomerTaxClassification9,
    hdr.IsEUTriangularDeal,
    hdr.SDPricingProcedure,
    hdr.ShippingCondition,
    hdr.PlantSupplier,
    hdr.IncotermsVersion,
    hdr.IncotermsClassification,
    hdr.IncotermsTransferLocation,
    hdr.IncotermsLocation1,
    hdr.IncotermsLocation2,
    hdr.PayerParty,
    hdr.ContractAccount,
    hdr.CustomerPaymentTerms,
    hdr.PaymentMethod,
    hdr.PaymentReference,
    hdr.FixedValueDate,
    hdr.AdditionalValueDays,
    hdr.SEPAMandate,
    hdr.CompanyCode,
    hdr.FiscalYear,
    hdr.AccountingDocument,
    hdr.FiscalPeriod,
    hdr.CustomerAccountAssignmentGroup,
    hdr.AccountingExchangeRateIsSet,
    hdr.AccountingExchangeRate,
    hdr.ExchangeRateDate,
    hdr.ExchangeRateType,
    hdr.DocumentReferenceID,
    hdr.AssignmentReference,
    hdr.ReversalReason,
    hdr.DunningArea,
    hdr.DunningBlockingReason,
    hdr.DunningKey,
    hdr.InternalFinancialDocument,
    hdr.IsRelevantForAccrual,
    hdr.InvoiceListType,
    hdr.InvoiceListBillingDate,
    hdr.BillingDocRequestReference,
    hdr.BillgDocReqRefLgclSyst,
    hdr.BillgDocReqRefSDDocCategory,
    hdr.SoldToParty,
    hdr.PartnerCompany,
    hdr.PurchaseOrderByCustomer,
    hdr.CustomerGroup,
    hdr.Country,
    hdr.CityCode,
    hdr.SalesDistrict,
    hdr.Region,
    hdr.County,
    hdr.CreditControlArea,
    hdr.CustomerRebateAgreement,
    hdr.PricingDocument,
    hdr.OverallSDProcessStatus,
    hdr.OverallBillingStatus,
    hdr.AccountingPostingStatus,
    hdr.AccountingTransferStatus,
    hdr.BillingIssueType,
    hdr.OverallBillingDocReqStatus,
    hdr.InvoiceListStatus,
    hdr.OvrlItmGeneralIncompletionSts,
    hdr.OverallPricingIncompletionSts,
    hdr.OverallDocumentBillingStatus,
    hdr.PrelimBillingDocumentStatus,
    hdr.InvoiceClearingStatus,
    hdr.BillgProcDocApprovalStatus,
    hdr.BillgProcDocApprovalReason,
    hdr.YY1_CLPDocApprovalSts_BDH,
    hdr.YY1_CLPNonStdDelvrDate_BDH,
    hdr.YY1_CLPNonStdDelivery_BDH,
    agg.Product,
    /* Associations */
    hdr._AccountingDocument,
    hdr._AccountingPostingStatus,
    hdr._AccountingTransferStatus,
    hdr._BillgDocReqRefSDDocCategory,
    hdr._BillgProcDocApprovalReason,
    hdr._BillgProcDocApprovalReasonT,
    hdr._BillgProcDocApprovalStatus,
    hdr._BillgProcDocApprovalStatusT,
    hdr._BillingDocumentCategory,
    hdr._BillingDocumentType,
    hdr._BillingIssueType,
    hdr._CancelledBillingDocumentBasic,
    hdr._CityCode,
    hdr._CompanyCode,
    hdr._Country,
    hdr._County,
    hdr._County_2,
    hdr._CreatedByUser,
    hdr._CreditControlArea,
    hdr._CreditControlAreaText,
    hdr._CustomerAccountAssgmtGroup,
    hdr._CustomerGroup,
    hdr._CustomerPaymentTerms,
    hdr._CustomerPriceGroup,
    hdr._DistributionChannel,
    hdr._Division,
    hdr._DunningArea,
    hdr._DunningAreaText,
    hdr._DunningBlockingReason,
    hdr._DunningKey,
    hdr._ExchangeRateType,
    hdr._FiscalYear,
    hdr._IncotermsClassification,
    hdr._IncotermsVersion,
    hdr._InvoiceClearingStatus,
    hdr._InvoiceListStatus,
    hdr._InvoiceListType,
    hdr._ItemBasic,
    hdr._LogicalSystem,
    hdr._OverallBillingStatus,
    hdr._OverallPricingIncompletionSts,
    hdr._OverallSDProcessStatus,
    hdr._OvrlBillingDocReqStatus,
    hdr._OvrlItmGeneralIncompletionSts,
    hdr._PartnerBasic,
    hdr._PayerParty,
    hdr._PaymentMethod,
    hdr._PrelimBillingDocumentStatus,
    hdr._PriceListType,
    hdr._PricingElementBasic,
    hdr._ProposedBillingDocumentType,
    hdr._Region,
    hdr._ReversalReason,
    hdr._SalesDistrict,
    hdr._SalesOrganization,
    hdr._SDDocumentCategory,
    hdr._SDPricingProcedure,
    hdr._ShippingCondition,
    hdr._SoldToParty,
    hdr._StatisticsCurrency,
    hdr._TaxDepartureCountry,
    hdr._TransactionCurrency,
    hdr._VATRegistrationCountry,
    hdr._VATRegistrationOrigin,
    hdr._YY1_CLPDocApprovalSts_BDH,
//    @EndUserText.label: 'Admin Fees'
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//    
////    hdr._PricingElementBasic[ ConditionType = 'ZADS' ].ConditionAmount as AdminFees,
//      cast(hdr.TotalNetAmount as abap.dec(16,2)) * cast( '0.05' as abap.dec(16,2) ) as AdminFees,
      @EndUserText.label: 'Expenses'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      cast( '0' as abap.dec(16,2) ) as Expenses,
//      @EndUserText.label: 'Courtesy Discount'
//      @Semantics.amount.currencyCode: 'TransactionCurrency'
//      cast( '0' as abap.dec(16,2) ) as CourtesyDiscount,
      
      
      
      
      @EndUserText.label: 'Admin Fees'
      cast( hdr._PricingElementBasic[ ConditionType = 'ZAD3' ].ConditionAmount as abap.dec(16,2)) as AdminFees,
      @EndUserText.label: 'Courtesy Discount'
      cast( hdr._PricingElementBasic[ ConditionType = 'ZCDS' ].ConditionAmount as abap.dec(16,2)) as CourtesyDiscount,
            
      
      @EndUserText.label: 'ZAD1 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      hdr._PricingElementBasic[ ConditionType = 'ZAD1' ].ConditionAmount         as ZAD1AdminFees,
      @EndUserText.label: 'ZAD3 Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      hdr._PricingElementBasic[ ConditionType = 'ZAD3' ].ConditionAmount         as ZAD3AdminFees,
      @EndUserText.label: 'ZADO Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      hdr._PricingElementBasic[ ConditionType = 'ZADO' ].ConditionAmount         as ZADOAdminFees,
      @EndUserText.label: 'ZADR Admin Fees'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      hdr._PricingElementBasic[ ConditionType = 'ZADR' ].ConditionAmount         as ZADRAdminFees,
      @EndUserText.label: 'ZCDS Courtesy Discount'
      @Semantics.amount.currencyCode: 'TransactionCurrency'
      hdr._PricingElementBasic[ ConditionType = 'ZCDS' ].ConditionAmount         as ZCDSCourtesyDiscount,
      
      
      cast( hdr._PricingElementBasic[ ConditionType = 'ZCDS' ].ConditionAmount as abap.dec(16,2)) as ZCDSCOURTESYDISCOUNTDEC
      
//    ,
//    MarkedWIP.Projbillgelmntentritmuuid
}where agg.Product = 'A001'
and hdr.OverallBillingStatus = 'A' //only completed
and ( MarkedWIP.Invoice is null  // ⬅️ Anti-join logic: exclude if Invoice exists in WIP
and MarkedOA.Invoice is null )
