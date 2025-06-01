@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BP Personal Number and Ext ID'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CLP_BPPersonExtID 
as select from I_BusinessUserBasic as I_BusinessUserBasic
association[0..*] to I_PersonWorkAgreement_1 as _I_PersonWorkAgreement_1 on _I_PersonWorkAgreement_1.Person = I_BusinessUserBasic.BusinessPartner
{
   key I_BusinessUserBasic.BusinessPartner,
   I_BusinessUserBasic.BusinessPartnerUUID,
   I_BusinessUserBasic.LastName,
   I_BusinessUserBasic.FirstName,
   I_BusinessUserBasic.PersonFullName,
   I_BusinessUserBasic.FormOfAddress,
   I_BusinessUserBasic.AcademicTitle,
   I_BusinessUserBasic.AcademicSecondTitle,
   I_BusinessUserBasic.CorrespondenceLanguage,
   I_BusinessUserBasic.MiddleName,
   I_BusinessUserBasic.AdditionalLastName,
   I_BusinessUserBasic.BirthName,
   I_BusinessUserBasic.NickName,
   I_BusinessUserBasic.Initials,
   I_BusinessUserBasic.LastNamePrefix,
   I_BusinessUserBasic.LastNameSecondPrefix,
   I_BusinessUserBasic.NameSupplement,
   I_BusinessUserBasic.UserID,
   I_BusinessUserBasic.IsMarkedForArchiving,
   I_BusinessUserBasic.BusinessPartnerIsBlocked,
   I_BusinessUserBasic.CreatedByUser,
   I_BusinessUserBasic.CreationDate,
   I_BusinessUserBasic.CreationTime,
   I_BusinessUserBasic.LastChangedByUser,
   I_BusinessUserBasic.LastChangeDate,
   I_BusinessUserBasic.LastChangeTime,
   I_BusinessUserBasic.IsBusinessPurposeCompleted,
   I_BusinessUserBasic.AuthorizationGroup,
   I_BusinessUserBasic.DataControllerSet,
   I_BusinessUserBasic.DataController1,
   I_BusinessUserBasic.DataController2,
   I_BusinessUserBasic.DataController3,
   I_BusinessUserBasic.DataController4,
   I_BusinessUserBasic.DataController5,
   I_BusinessUserBasic.DataController6,
   I_BusinessUserBasic.DataController7,
   I_BusinessUserBasic.DataController8,
   I_BusinessUserBasic.DataController9,
   I_BusinessUserBasic.DataController10,
//   _BusinessPartnerExternalID.BPIdentificationNumber,
   _I_PersonWorkAgreement_1.PersonWorkAgreement as PersonWorkAgreement,
   _I_PersonWorkAgreement_1.AuthorizationGroup as AuthorizationGroup_1,
   _I_PersonWorkAgreement_1.PersonFullName as PersonFullName_1,
   _I_PersonWorkAgreement_1._PersonWorkAgrmtToExternalID.PersonWorkAgreementExternalID as PersonWorkAgreementExternalID,
   I_BusinessUserBasic._User._AddrCurDefaultEmailAddress.EmailAddress as EmailAddress,
   /* Associations */
   I_BusinessUserBasic._BusinessPartnerExternalID,
   I_BusinessUserBasic._BusinessPartnerRole,
   I_BusinessUserBasic._User,
   I_BusinessUserBasic._WorkplaceAddress,
   _I_PersonWorkAgreement_1
}
