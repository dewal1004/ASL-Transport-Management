codeunit 104000 "UPG.W1"
{
    Permissions = TableData "Item Ledger Entry" = m;
    Subtype = Upgrade;

    trigger OnRun()
    begin
    end;

    var
        DataUpgradeMgt: Codeunit "Data Upgrade Mgt.";
        WorkflowInstancessAreRunningErr: Label 'There is one or more active workflow instances. You must complete all running workflows before proceeding with the upgrade.';
        UnableToUpgradeProductGroupErr: Label 'Unable to upgrade Product Group (%1,%2) because of Code duplication. Please make sure that this product group has a unique Code, and retry the upgrade.', Comment = '%1 - item category code, %2 - product group code';
        JobListTxt: Label 'Job List', Locked = true;
        JobTaskLinesTxt: Label 'Job Task Lines', Locked = true;
        JobPlanningLinesTxt: Label 'Job Planning Lines', Locked = true;
        PowerBICustomerListTxt: Label 'Power BI Customer List', Locked = true;
        PowerBIVendorListTxt: Label 'Power BI Vendor List', Locked = true;
        PowerBIJobsListTxt: Label 'Power BI Jobs List', Locked = true;
        PowerBISalesListTxt: Label 'Power BI Sales List', Locked = true;
        PowerBIPurchaseListTxt: Label 'Power BI Purchase List', Locked = true;
        PowerBIItemPurchasesListTxt: Label 'Power BI Item Purchase List', Locked = true;
        PowerBIItemSalesListTxt: Label 'Power BI Item Sales List', Locked = true;
        PowerBIGLAmountListTxt: Label 'Power BI GL Amount List', Locked = true;
        PowerBIGLBudgetedAmountListTxt: Label 'Power BI GL BudgetedAmount', Locked = true;
        PowerBITopCustOverviewTxt: Label 'Power BI Top Cust. Overview', Locked = true;
        PowerBISalesHdrCustTxt: Label 'Power BI Sales Hdr. Cust.', Locked = true;
        PowerBICustItemLedgEntTxt: Label 'Power BI Cust. Item Ledg. Ent.', Locked = true;
        PowerBICustLedgerEntriesTxt: Label 'Power BI Cust. Ledger Entries', Locked = true;
        PowerBIVendorLedgerEntriesTxt: Label 'Power BI Vendor Ledger Entries', Locked = true;
        PowerBIPurchaseHdrVendorTxt: Label 'Power BI Purchase Hdr. Vendor', Locked = true;
        PowerBIVendItemLedgEntTxt: Label 'Power BI Vend. Item Ledg. Ent.', Locked = true;
        PowerBIAgedAccPayableTxt: Label 'Power BI Aged Acc. Payable', Locked = true;
        PowerBIAgedAccReceivableTxt: Label 'Power BI Aged Acc. Receivable', Locked = true;
        PowerBIAgedInventoryChartTxt: Label 'Power BI Aged Inventory Chart', Locked = true;
        PowerBIJobActBudgPriceTxt: Label 'Power BI Job Act. v. Budg. Price', Locked = true;
        PowerBIJobProfitabilityTxt: Label 'Power BI Job Profitability', Locked = true;
        PowerBIJobActBudgCostTxt: Label 'Power BI Job Act. v. Budg. Cost', Locked = true;
        PowerBISalesPipelineTxt: Label 'Power BI Sales Pipeline', Locked = true;
        PowerBITop5OpportunitiesTxt: Label 'Power BI Top 5 Opportunities', Locked = true;
        PowerBIWorkDateCalcTxt: Label 'Power BI WorkDate Calc.', Locked = true;
        PowerBIReportLabelsTxt: Label 'Power BI Report Labels', Locked = true;
        UnableToUpgradeItemCategoryErr: Label 'Unable to upgrade Item Category %1 because of Code duplication. Please make sure that this Item Category has a unique Code, and retry the upgrade.', Comment = '%1 - item category code';
        WebServiceManagement: Codeunit "Web Service Management";
        ExcelTemplateIncomeStatementTxt: Label 'ExcelTemplateIncomeStatement';
        ExcelTemplateBalanceSheetTxt: Label 'ExcelTemplateBalanceSheet';
        ExcelTemplateTrialBalanceTxt: Label 'ExcelTemplateTrialBalance';
        ExcelTemplateRetainedEarningsStatementTxt: Label 'ExcelTemplateRetainedEarnings';
        ExcelTemplateCashFlowStatementTxt: Label 'ExcelTemplateCashFlowStatement';
        ExcelTemplateAgedAccountsReceivableTxt: Label 'ExcelTemplateAgedAccountsReceivable';
        ExcelTemplateAgedAccountsPayableTxt: Label 'ExcelTemplateAgedAccountsPayable';
        ExcelTemplateCompanyInformationTxt: Label 'ExcelTemplateViewCompanyInformation';
        ODataUtility: Codeunit ODataUtility;
        PowerBIChartOfAccountsTxt: Label 'Chart of Accounts';

    [CheckPrecondition]
    [Scope('Internal')]
    procedure CheckPreconditions()
    var
        WorkflowStepInstance: Record "Workflow Step Instance";
    begin
        if not WorkflowStepInstance.IsEmpty then
            Error(WorkflowInstancessAreRunningErr);
    end;

    [TableSyncSetup]
    [Scope('Internal')]
    procedure GetTableSyncSetupW1(var TableSynchSetup: Record "Table Synch. Setup")
    begin
        // The purpose of this method is to define how old and new tables will be available for dataupgrade

        // The method is called at a point in time where schema changes have not yet been synchronized to
        // the database so tables except virtual tables cannot be accessed

        // TableSynchSetup."Table ID":
        // Id of the table with schema changes (i.e the modified table).

        // TableSynchSetup."Upgrade Table ID":
        // Id of table where old data will be available in case the selected TableSynchSetup.Mode option is one of Copy or Move , otherwise 0

        // TableSynchSetup.Mode:
        // An option indicating how the data will be handled during synchronization
        // Check: Synchronize without saving data in the upgrade table, fails if there is data in the modified field/table
        // Copy: Synchronize with saving data in the upgrade table, the modified table contains data in matching fields
        // Move: Synchronize with moving the data in the upgrade table,the changed table is empty; the upgrade logic is handled only by application code
        // Force: Synchronize without saving data in the upgrade table, disregard if there is data in the modified field/table

        // Ship Test Automation
        DataUpgradeMgt.SetTableSyncSetup(130400, 0, TableSynchSetup.Mode::Force); // CAL Test Suite
        DataUpgradeMgt.SetTableSyncSetup(130401, 0, TableSynchSetup.Mode::Force); // CAL Test Line
        DataUpgradeMgt.SetTableSyncSetup(130402, 0, TableSynchSetup.Mode::Force); // CAL Test Codeunit
        DataUpgradeMgt.SetTableSyncSetup(130403, 0, TableSynchSetup.Mode::Force); // CAL Test Enabled Codeunit
        DataUpgradeMgt.SetTableSyncSetup(130404, 0, TableSynchSetup.Mode::Force); // CAL Test Method
        DataUpgradeMgt.SetTableSyncSetup(130405, 0, TableSynchSetup.Mode::Force); // CAL Test Result
        DataUpgradeMgt.SetTableSyncSetup(130406, 0, TableSynchSetup.Mode::Force); // CAL Test Coverage Map

        DataUpgradeMgt.SetTableSyncSetup(470, 0, TableSynchSetup.Mode::Force); // Job Queue
        DataUpgradeMgt.SetTableSyncSetup(472, 0, TableSynchSetup.Mode::Force); // Job Queue Entry
        DataUpgradeMgt.SetTableSyncSetup(474, 0, TableSynchSetup.Mode::Force); // Job Queue Log Entry
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Approval Comment Line", DATABASE::"UPG Approval Comment Line",
          TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Document Sending Profile", DATABASE::"UPG Document Sending Profile",
          TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(5371, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(5372, 0, TableSynchSetup.Mode::Force);

        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"XML Structure", 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Table Permission Buffer", DATABASE::"Table Permission Buffer", TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Payment Method", DATABASE::"Payment Method", TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Sales Header", DATABASE::"Sales Header", TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(824, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(825, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(826, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(827, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(828, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(829, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(830, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Sales Invoice Header", DATABASE::"UPG Sales Invoice Header", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Sales Cr.Memo Header", DATABASE::"UPG Sales Cr.Memo Header", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Purch. Inv. Header", DATABASE::"UPG Purch. Inv. Header", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Purch. Cr. Memo Hdr.", DATABASE::"UPG Purch. Cr. Memo Hdr.", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::Item, DATABASE::"UPG Item", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Item Category", DATABASE::"UPG Item Category", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Nonstock Item", DATABASE::"UPG Nonstock Item", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Ledger Entry Matching Buffer", 0, TableSynchSetup.Mode::Check);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Bank Statement Matching Buffer", 0, TableSynchSetup.Mode::Check);
        DataUpgradeMgt.SetTableSyncSetup(8640, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"SMTP Mail Setup", DATABASE::"UPG SMTP Mail Setup", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(1305, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(1510, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Notification Setup", 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(1601, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::Job, DATABASE::"UPG Job", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(5079, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(5150, 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Custom Report Layout", DATABASE::"UPG Custom Report Layout", TableSynchSetup.Mode::Move);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Custom Report Selection", DATABASE::"UPG Custom Report Selection", TableSynchSetup.Mode::Copy);
        DataUpgradeMgt.SetTableSyncSetup(
          DATABASE::"Report Layout Selection", DATABASE::"UPG Report Layout Selection", TableSynchSetup.Mode::Copy);

        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"My Customer", 0, TableSynchSetup.Mode::Check);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"My Vendor", 0, TableSynchSetup.Mode::Check);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"My Item", 0, TableSynchSetup.Mode::Check);

        // Manual Setup Add Icon
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Business Setup Icon", 0, TableSynchSetup.Mode::Check);

        // Contact Duplicate Search
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Cont. Duplicate Search String", 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Duplicate Search String Setup", 0, TableSynchSetup.Mode::Force);

        // CRM Integration Notifications
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"CRM Integration Record", 0, TableSynchSetup.Mode::Force);
        // CRM Integration performance
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"CRM Connection Setup", 0, TableSynchSetup.Mode::Force);

        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Sales & Receivables Setup", 0, TableSynchSetup.Mode::Force);
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Purchases & Payables Setup", 0, TableSynchSetup.Mode::Force);

        // Intrastat Contact Setup
        DataUpgradeMgt.SetTableSyncSetup(DATABASE::"Company Information", DATABASE::"UPG Company Information", TableSynchSetup.Mode::Copy);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateOfficeAdminCredentials()
    var
        OfficeAdminCredentials: Record "Office Admin. Credentials";
        ServicePassword: Record "Service Password";
    begin
        if OfficeAdminCredentials.FindSet then
            repeat
                ServicePassword.Init;
                ServicePassword.SavePassword(OfficeAdminCredentials.Password);
                ServicePassword.Insert(true);
                OfficeAdminCredentials.Password := ServicePassword.Key;
                OfficeAdminCredentials.Modify;
            until OfficeAdminCredentials.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdatePostCodeServiceConfig()
    var
        PostcodeServiceConfig: Record "Postcode Service Config";
        ServicePassword: Record "Service Password";
    begin
        if PostcodeServiceConfig.FindSet then
            repeat
                ServicePassword.Init;
                ServicePassword.SavePassword(PostcodeServiceConfig.ServiceKey);
                ServicePassword.Insert(true);

                PostcodeServiceConfig.ServiceKey := ServicePassword.Key;
                PostcodeServiceConfig.Modify;
            until PostcodeServiceConfig.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateCRMIntegrationRecordTableID()
    var
        CRMIntegrationRecord: Record "CRM Integration Record";
        IntegrationRecord: Record "Integration Record";
        RecID: RecordID;
    begin
        if CRMIntegrationRecord.FindSet then
            repeat
                if IntegrationRecord.Get(CRMIntegrationRecord."Integration ID") then begin
                    RecID := IntegrationRecord."Record ID";
                    CRMIntegrationRecord."Table ID" := RecID.TableNo;
                    CRMIntegrationRecord.Modify;
                end;
            until CRMIntegrationRecord.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateCompanyInfo()
    var
        CompanyInformation: Record "Company Information";
    begin
        if StrPos(CompanyName, 'CRONUS') = 1 then begin
            CompanyInformation.Get;
            CompanyInformation."Demo Company" := true;
            CompanyInformation.Modify;
        end;
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure UpdateSalesIcons()
    var
        UPGSalesDocumentIcons: Codeunit "UPG Sales Document Icons";
        Type: Integer;
        TotalIcons: Integer;
    begin
        TotalIcons := 6;
        for Type := 0 to (TotalIcons - 1) do
            UPGSalesDocumentIcons.InsertIcon(Type);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateItem()
    begin
        UpdateItemPicture;
        UpdateItemCategoryPostingGroups;
        UpdateMyItem;
        UpgradeProductGroup;
        UpdateBlockedFields;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateApprovalCommentLine()
    var
        ApprovalCommentLine: Record "Approval Comment Line";
        ApprovalEntry: Record "Approval Entry";
        UPGApprovalCommentLine: Record "UPG Approval Comment Line";
    begin
        if UPGApprovalCommentLine.FindSet then
            repeat
                ApprovalEntry.SetRange("Record ID to Approve", UPGApprovalCommentLine."Record ID to Approve");
                if ApprovalEntry.FindFirst then begin
                    ApprovalCommentLine.Get(UPGApprovalCommentLine."Entry No.");
                    // ApprovalCommentLine.INIT;
                    // ApprovalCommentLine.TRANSFERFIELDS(UPGApprovalCommentLine);
                    ApprovalCommentLine."Workflow Step Instance ID" := ApprovalEntry."Workflow Step Instance ID";
                    ApprovalCommentLine.Modify;
                end;
            until UPGApprovalCommentLine.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateDocumentSendingProfile()
    var
        UPGDocumentSendingProfile: Record "UPG Document Sending Profile";
        DocumentSendingProfile: Record "Document Sending Profile";
    begin
        if UPGDocumentSendingProfile.FindSet then
            repeat
                DocumentSendingProfile.Get(UPGDocumentSendingProfile.Code);
                case UPGDocumentSendingProfile.Usage of
                    UPGDocumentSendingProfile.Usage::"Service Invoice":
                        DocumentSendingProfile.Usage := DocumentSendingProfile.Usage::"Service Invoice";
                    UPGDocumentSendingProfile.Usage::"Service Credit Memo":
                        DocumentSendingProfile.Usage := DocumentSendingProfile.Usage::"Service Credit Memo";
                end;
                DocumentSendingProfile.Modify;
            until UPGDocumentSendingProfile.Next = 0;
        UPGDocumentSendingProfile.DeleteAll;
    end;

    local procedure UpdateItemCategoryPostingGroups()
    var
        UPGItemCategory: Record "UPG Item Category";
        UPGItem: Record "UPG Item";
        UPGNonstockItem: Record "UPG Nonstock Item";
        TempItemTemplateCode: Code[10];
    begin
        if not UPGItemCategory.FindSet then
            exit;

        repeat
            UPGItem.SetRange("Item Category Code", UPGItemCategory.Code);
            UPGNonstockItem.SetRange("Item Category Code", UPGItemCategory.Code);
            if (not UPGItem.IsEmpty) or (not UPGNonstockItem.IsEmpty) then begin
                CreateItemTemplateFromItemCategory(UPGItemCategory, TempItemTemplateCode);
                ModifyNonStockItemTemplateCode(UPGNonstockItem, TempItemTemplateCode);
            end;
        until UPGItemCategory.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateReportSelections()
    var
        ReportSelections: Record "Report Selections";
    begin
        ReportSelections.ModifyAll("Use for Email Attachment", true);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateOfficeHostProviderSetup()
    begin
        CODEUNIT.Run(CODEUNIT::"Setup Office Host Provider");
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateAzureADMgtProviderSetup()
    begin
        CODEUNIT.Run(CODEUNIT::"Setup Azure AD Mgt. Provider");
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateSMTPMailSetupEncryptPassword()
    var
        SMTPMailSetup: Record "SMTP Mail Setup";
        UPGSMTPMailSetup: Record "UPG SMTP Mail Setup";
        ServicePassword: Record "Service Password";
    begin
        if UPGSMTPMailSetup.FindSet then
            repeat
                ServicePassword.Init;
                ServicePassword.SavePassword(UPGSMTPMailSetup.Password);
                ServicePassword.Insert(true);

                SMTPMailSetup.Get(UPGSMTPMailSetup."Primary Key");
                SMTPMailSetup."Password Key" := ServicePassword.Key;
                SMTPMailSetup.Modify;
            until UPGSMTPMailSetup.Next = 0;
    end;

    local procedure UpdateItemPicture()
    var
        Item: Record Item;
        UPGItem: Record "UPG Item";
    begin
        if not Item.FindSet then
            exit;

        UPGItem.SetAutoCalcFields(Picture);

        repeat
            UPGItem.Get(Item."No.");
            MoveBlobToMediaSet(UPGItem, Item);
        until Item.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateCustomerPictures()
    var
        Customer: Record Customer;
    begin
        if not Customer.FindSet then
            exit;

        Customer.SetAutoCalcFields(Picture);

        repeat
            ConvertBlobToMediaSetCustomer(Customer);
        until Customer.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateVendorPictures()
    var
        Vendor: Record Vendor;
    begin
        if not Vendor.FindSet then
            exit;

        Vendor.SetAutoCalcFields(Picture);

        repeat
            ConvertBlobToMediaSetVendor(Vendor);
        until Vendor.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateContactPictures()
    var
        Contact: Record Contact;
    begin
        if not Contact.FindSet then
            exit;

        Contact.SetAutoCalcFields(Picture);

        repeat
            ConvertBlobToMediaSetContact(Contact);
        until Contact.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateEmployeePictures()
    var
        Employee: Record Employee;
    begin
        if not Employee.FindSet then
            exit;

        Employee.SetAutoCalcFields(Picture);

        repeat
            ConvertBlobToMediaSetEmployee(Employee);
        until Employee.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateBankAccPictures()
    var
        BankAccount: Record "Bank Account";
    begin
        if not BankAccount.FindSet then
            exit;

        BankAccount.SetAutoCalcFields(Picture);

        repeat
            ConvertBlobToMediaSetBankAcc(BankAccount);
        until BankAccount.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateMyCustomer()
    var
        MyCustomer: Record "My Customer";
        Customer: Record Customer;
    begin
        if not MyCustomer.FindSet(true) then
            exit;

        repeat
            if Customer.Get(MyCustomer."Customer No.") then begin
                MyCustomer.Validate(Name, Customer.Name);
                MyCustomer.Validate("Phone No.", Customer."Phone No.");
                MyCustomer.Modify(true);
            end;
        until MyCustomer.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateMyVendor()
    var
        MyVendor: Record "My Vendor";
        Vendor: Record Vendor;
    begin
        if not MyVendor.FindSet(true) then
            exit;

        repeat
            if Vendor.Get(MyVendor."Vendor No.") then begin
                MyVendor.Validate(Name, Vendor.Name);
                MyVendor.Validate("Phone No.", Vendor."Phone No.");
                MyVendor.Modify(true);
            end;
        until MyVendor.Next = 0;
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure UpgradePermissionSets()
    var
        PermissionSet: Record "Permission Set";
        PermissionManager: Codeunit "Permission Manager";
    begin
        PermissionSet.SetRange(Hash, '');
        if PermissionSet.FindSet then
            repeat
                PermissionManager.UpdateHashForPermissionSet(PermissionSet."Role ID");
            until PermissionSet.Next = 0;
    end;

    local procedure UpdateMyItem()
    var
        MyItem: Record "My Item";
        Item: Record Item;
    begin
        if not MyItem.FindSet(true) then
            exit;

        repeat
            if Item.Get(MyItem."Item No.") then begin
                MyItem.Validate(Description, Item.Description);
                MyItem.Validate("Unit Price", Item."Unit Price");
                MyItem.Modify(true);
            end;
        until MyItem.Next = 0;
    end;

    local procedure UpgradeProductGroup()
    var
        ProductGroup: Record "Product Group";
    begin
        if not ProductGroup.FindSet then
            exit;

        repeat
            CreateItemCategory(ProductGroup);
            SaveWarehouseClassCode(ProductGroup);
        until ProductGroup.Next = 0;
    end;

    local procedure MoveBlobToMediaSet(var UPGItem: Record "UPG Item"; var Item: Record Item)
    var
        PictureInStream: InStream;
    begin
        if not UPGItem.Picture.HasValue then
            exit;

        UPGItem.Picture.CreateInStream(PictureInStream);
        Clear(Item.Picture);
        Item.Picture.ImportStream(PictureInStream, '');
        Item.Modify;
    end;

    local procedure ConvertBlobToMediaSetCustomer(var Customer: Record Customer)
    var
        PictureInStream: InStream;
    begin
        if not Customer.Picture.HasValue then
            exit;

        Customer.Picture.CreateInStream(PictureInStream);
        if not IsNullGuid(Customer.Image.ImportStream(PictureInStream, '')) then begin
            Clear(Customer.Picture);
            Customer.Modify;
        end;
    end;

    local procedure ConvertBlobToMediaSetVendor(var Vendor: Record Vendor)
    var
        PictureInStream: InStream;
    begin
        if not Vendor.Picture.HasValue then
            exit;

        Vendor.Picture.CreateInStream(PictureInStream);
        if not IsNullGuid(Vendor.Image.ImportStream(PictureInStream, '')) then begin
            Clear(Vendor.Picture);
            Vendor.Modify;
        end;
    end;

    local procedure ConvertBlobToMediaSetContact(var Contact: Record Contact)
    var
        PictureInStream: InStream;
    begin
        if not Contact.Picture.HasValue then
            exit;

        Contact.Picture.CreateInStream(PictureInStream);
        if not IsNullGuid(Contact.Image.ImportStream(PictureInStream, '')) then begin
            Clear(Contact.Picture);
            Contact.Modify;
        end;
    end;

    local procedure ConvertBlobToMediaSetEmployee(var Employee: Record Employee)
    var
        PictureInStream: InStream;
    begin
        if not Employee.Picture.HasValue then
            exit;

        Employee.Picture.CreateInStream(PictureInStream);
        if not IsNullGuid(Employee.Image.ImportStream(PictureInStream, '')) then begin
            Clear(Employee.Picture);
            Employee.Modify;
        end;
    end;

    local procedure ConvertBlobToMediaSetBankAcc(var BankAccount: Record "Bank Account")
    var
        PictureInStream: InStream;
    begin
        if not BankAccount.Picture.HasValue then
            exit;

        BankAccount.Picture.CreateInStream(PictureInStream);
        if not IsNullGuid(BankAccount.Image.ImportStream(PictureInStream, '')) then begin
            Clear(BankAccount.Picture);
            BankAccount.Modify;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateJobQueueEntry()
    var
        JobQueueEntry: Record "Job Queue Entry";
        NotificationEntry: Record "Notification Entry";
        NotificationSchedule: Record "Notification Schedule";
    begin
        JobQueueEntry.SetRange("Object Type to Run", JobQueueEntry."Object Type to Run"::Codeunit);
        JobQueueEntry.SetRange("Object ID to Run", CODEUNIT::"Notification Entry Dispatcher");
        JobQueueEntry.DeleteAll;

        if NotificationEntry.FindSet then
            repeat
                NotificationSchedule.ScheduleNotification(NotificationEntry);
            until NotificationEntry.Next = 0;
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure UpdateManualSetupIcons()
    var
        BusinessSetupIcon: Record "Business Setup Icon";
        Convert: DotNet BCConvert;
        ByteArray: DotNet BCArray;
        MemoryStream: DotNet BCMemoryStream;
    begin
        BusinessSetupIcon.Init;
        BusinessSetupIcon."Business Setup Name" := 'Default';
        ByteArray := Convert.FromBase64String(GetManualSetupDefaultIcon);
        MemoryStream := MemoryStream.MemoryStream(ByteArray);
        BusinessSetupIcon.Icon.ImportStream(MemoryStream, 'Default');

        if not BusinessSetupIcon.Insert then
            BusinessSetupIcon.Modify;
    end;

    local procedure GetManualSetupDefaultIcon(): Text
    var
        IconData: Text;
    begin
        IconData += 'iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAYAAAA+VemSAAAACXBIWXMAAAsSAAALEgHS3X78AAAgAElEQVR42u19T2gbaZr3M9kheyhdhg';
        IconData += 'G7DMM2NhI7MHYjsYdxg+WLfZgyS5xDpAFn4YuqSXYPn5SYb3eJ5PTSsLEU5uK0dEuYUl/a0FIO6zBYfZAvliFiDiMTh4ZBwoZhISUvzPfBVF06h/k';
        IconData += 'Olbf8vqXSn5JV0luq5wdNx8a2pKr6vc//3/OjH374n78CAoHwJG7gJUAgkMAIBAIJjEAgkMAIBBIYgUAggREIBBIYgUAggREIJDACgUACIxAIJDAC';
        IconData += 'gQRGIBBIYAQCgQRGIBBIYAQCCYxAIJDACAQCCYxAIJDACAQSGIFAIIERCAQSGIFAAiMQCCQwAoFAAiMQCCQwAoEERiAQSGAEAoEERiAQSGAEAgmMQ';
        IconData += 'CAmhR/jJfAeVLUN799fgqbp0GyeU99rO/o7c3OzIIqzH/89A6I4a/4f4Q38CBd8803UZvMCms1zaDbPQVXb0GpdjOW1g8F5CAQEiEQ+hVBoAUKheS';
        IconData += 'Q2EhjRC43GGTQaZ9BsnkOjcQa6rnP1/gRBgFBoHiKRTyESWYJIZAlvGhLY3xb2+LhuEncQwtKWEQBMEgUCAoRCC45ev9k8B03TzcPj6nsanJ6+G+h';
        IconData += 'vrKwsQySyBKury2ihkcD+IW2lUu3pDtPWLhRaAFGccUzQUbrwjcZbaDYveh4yojgD0egySNL62N8rEhjhGjRNh8PDak/SCoJguqWRyBK3BFDVtukx';
        IconData += 'HB/XuxJaFGcgFttEy4wE9nZMW6lUoVI56uoORyJLnrZYzeY51Gp1qNXedD2cVlaWYWNjHaLRZXwokMD8W9ta7Q0oyj6o6qWvLFO/8IB89o2NdQgEB';
        IconData += 'HxYkMB8EbdUOoBS6aDDrRQEAVZXlyEW2/RNbKiqbSiVDuDw8Mj2esTjm7CxsYbuNRKYX+IGg/MQj2+CJK37+hpVKlU4PKzaZrYlaQ1keQuJjATmh7';
        IconData += 'grK8sQj29indQmXi6XDzpyAsQix+Ob6FojgcdjUexiXLQmg7vXirJvS2RZ3oJ4fBMvEhLYHQuSz7/ocAWRuKMlsijOQCazjR4MEnh07rKifAPl8mv';
        IconData += 'm++HwIsjyXXzQRkDk3d29joNxZWUZdna20a1GAg+PWq0O+fwLxl0WxRlIpR5gXXPEaDTOIJvdY661IAiws7ON1xoJ7Nzq5vMvOty7RGILky0uQ1H2';
        IconData += 'O5KDaI2RwI5i3UzmKWMJgsF5yGS2scd3gm61IAiQyz3BkAUJ3Pv0Lxb3O6yuLG/hxZkASqUDUJR9xhrHYrcglXqAFwcJzLrMu7t7cHJSR6vLoTVOp';
        IconData += '58y7ZnB4DwUCs9871Ijgbu4zLHYLZDluxhzcewdCYIAhULO1wes7wlcq9Vhd3fPdNEEQYCHD+/7vv2RVzQaZ5BOP2Vc6kzmkW/vl68JXCodQKHwEl';
        IconData += '3mKXCp/RoX+5bA2eweUyIKhxchl/sCXWYP5SysZT5JWoNMZhsJ7Dfy+vHGT2tc7LeD2FcEtju1k8n72DzvcVQqVchmnzOhkF8y1L4hsKbpkEw+ZuI';
        IconData += 'mPyc/pg3WZKRfSOwLAiN5/YFm8xySybSvSOyL3Uj5/Ask7wgsXDa7N9DPkqEEsvZlXAiFFqBQyIEgGIRttS4gmXxsal+jBfYgrAkrJK8zz+XwsArl';
        IconData += '8oHZ5NKvrVTTdEgkkubPh8OLEI/fHus0kZ0lLhYLSGAkr39c0XL5wFb3WRAE+PrrfFfxArtecoDxK1JaSTytlYapJbA1M4nkHeyadROfoxEOL0Kh8';
        IconData += 'MyWNLKc6vm7RKFzHAomtVodMpmn5tfT2OzxN1988e9fTmO89uWXvzG/Tibvw+3bG8jQLiiVDuDLL38DlcqRrZa1JBnyr3/6038DAICqXkIgIMAvfv';
        IconData += 'Fz5uf+9V//A/785//HXPc///n/Mt/78OEDtFoXUC6/hmbzHBYX/x4CgYArn+uTT34Gc3MzUKsZAyrff/9HmJubmapOu6lLYjWb57C7u8c8fFjn7R/';
        IconData += 'rWokrijOQTN6HSuVbyGS2YWdnG0RxhnGV6eRQqXTAJAqJ8EGxWIB8PgeStNbxuicnddfIe3X/1yGR2KLCqudjT64hgR08iJnMVaN7OLyIHVYDwDog';
        IconData += 'n80+gXJZYZRHAgGBcT91XTcPSiJOR5OfTnRFIkuQyWxDpfItQ2RRnBlLPCzLW8zrJpNpUNU2Epg37O5e6SkFg/OQy32B7BwAVpcyFJq3/blodBlWV';
        IconData += 'pYZCxqN/iPEYp9bpoPsD81AQGAIO05ljVTqAQSD8+bhk04/RQLzFseRYXxBECCTQf2kQREICObDDXC1K9gODx/eN+us9i7rWk9i0n87GFwY62csFJ';
        IconData += '4xNeJ8/gUSmJe4lx4LfPjwPo4EXsON7kVgUZztWgcWBKFvlpeOk8etbRUIGJpaBOXyazPB5VX8eFriXtoCYLnoem50vyRPPL5p290UiSz19Hrog8F';
        IconData += 'YYD7+QzYSWYJEYsusVe/u7sGrV4pnvTXPE1hRvmHiXhQ7u74FbrUuQNP0ng/1MCJ/NIG7xdnjgCxvQaPxFk5P35nJONoyows9JjQaZ8y2BIx77VGr';
        IconData += '1SGRSH7sTKvaZmCt5ZxebvTw9+utrcW3vq6i7EM6/RQSiaRr12RnZ9uMh09OjJ3GaIHH7DrTzfWJxBbGvV1weGgs3G61LszWUkEQIBJZglBoASKRp';
        IconData += 'Y6ETrN5PvL+ZbrWXC6/BlGchbm5WWg03kKzeW7bAVar1V3poyaxPMmdfPXVS4hGP/OcAfBsK2U+/8K0vtPcrH590rQhFvvc0e+4tQXB2p886Htx07';
        IconData += '1NJh+bB4fbr4UuNPUgWF1nRDfrezXMIQhsucgOkrQGudwTVyyRddzPDtb3eHJSd7XpwupKuxE6oAXucWri1oTeiMVk03Ul8kGapkOzeQ6NxpmZzAH';
        IconData += 'oPqTgxgFMLLEozkAksgTB4ILp0lvft9tDCLQ6qSjOQLmsIIHdAj1lJIozUCwWMHHVBdZpnErl267XqtE4g1BoYeBraZD/ylrNzc1AMLgwcB6CWNVu';
        IconData += 'E0k0qQRBgO+++9bVa5VIJM0atZeMgueSWHTPrSxvIXl7us9VxjXuda0GaaogPc92c8IEpA+6Xy2+3yjhxsa6SWBd16FSqbpa30+lHkAqlTYPD69so';
        IconData += 'LzhNfLSSg/YsNGbbPSep1jsehNZlUoV7t1LQaVy1DMJpaqXkM0+v7aUTSAgMAMIpdKBq9crElky+7x1XXf99XxHYE1jL6os30WW9rS+V8mrYHD+Wi';
        IconData += 'U2ErZYiRsMzoMkrUE4vNiRmDo9fQd37sjXGt2jD51W68L1McCHD++b/y4W9z0xseQZAtMLn8PhRdwROwDpCN6/vxy659cQs3tuIdYtqNV+B8ViATK';
        IconData += 'ZbSgUnsF3330LipJnMsi6btTqh7HEmqZDucxaQevXo4YozjJWnw7XkMAjtL47O1g26uc+08P3um70iyeTjx1ZFbJylUAQBMjnc10zwqHQAhSLBYjF';
        IconData += 'bjGW06k7WqlU4c4dmdEzAwD4y1/cV5ekk1eGQkkbCTxK60vkXRC9LUmh8AwymUeMa3t6+g7u3UsNbFkOD6uM27yzsz2Q55NKPYBweJG5f4NYYVVtQ';
        IconData += 'zL5uMNdF8UZyOdzY2my8JoV9gyBR5WM8RMkaR1evVIYi6jrOhSL+5BIJPs2LdBuuCStOWpppBskdF2HWu1Nz59XlH2IxT7vaKc0JocKYw2ZaCt8fF';
        IconData += 'znWleaewJXKlUm9sV+Z2cgUjj5fI6JT1utC1CUb3q6z/TsrtOMvyjODjxj3GicdUjRhsOLoCj5iZQKaSvMe0aaewJj5nk0iESWoFgsMAJvvWDN+A5';
        IconData += 'jAenD9v37ds/3RiOZvA+FwrOJHtZsLFxFAg+DRuPMtAKk5Q5xPdCkmJsbLJdAJ8ScHhrDgAcVUVGcNeN4Vb3klsRcE5i+aNjvPBrQlrWXVaRhpxU9';
        IconData += '6AE8DHiRuYnHb5v/prvakMADQNN0ZnY1Gv0M2XdN4iaTj23XnvSz1MOSkT4seuk/W//2MCUvNxCNLpvex+npOy5LStwSmM5arq4uY8/zNQ5CRdkHW';
        IconData += 'U4xGV5RnGEsjBWBgMC4zv2yyHavSxOzlzsdCi10xOZOS15ugU7e0d1tSOA+wNLRKA5BQ0rHanVjsVtQLBb6loXoh7dcfu3ICtPLtgGM4YReh4Usb9';
        IconData += 'l2cg1a8nILGxtrtiEdErhnzNVmkldYOnJudZPJx5DJPGXiV1KaSaUeDOTRxOObTCPIoDt/aY1ucmAM8nqkkyuZZLWnW60LSKXSE9FxFsVZ81BR1Uv';
        IconData += 'u1rJwSeDj4zoThyCGiXmvariCIAxVmgkEBKZtVVUvQZa7u7Wkk4rW6DbGC52V/+LxTfj66zyzBQLA6OmetBvNmxXmcqCfHq5WlDxa4CFAa4ZdV2mD';
        IconData += '/ls0SGPN+/eX0Gqdd2SrBUGAQiE39P2zrivN53MTKSXSumK8KXZwZ4HpDiB0n4cHXUs9PX13LdcvlXoAmcyjju+fnr6Dcvn1R90qlrzB4Py1yGvE3';
        IconData += 'QeMJZ9UHwDPbjR3BKazneg+X++howcKrjuKJ0nrUC7/1nZNKPu6M2b/8nXIq2k6E0pNug+AdqN5Er7jTlKHvjhY+70eNjbWzdLR8XEdUqnu2xaazf';
        IconData += 'O+hBPFWchktiGVegCNxpmlziswonSDuKWBQKDr+6EnoXjoA1hdXTZj+1rtDTc7p7kjMDl1ifA44npWg8gQkYkgYkkIAYk4na7rIElrA0n0BgICRKP';
        IconData += 'LQ3tItCplMDjPCMyTUVHaY+ChD0AUZ0EUZ0BVL+H09F3f1TO+JHCzeW6eukje0ZGY1IEVZR8OD6u2GxAAwOx8c1Nn2yruTjZG0C44IQov7jNBJLJk';
        IconData += 'XqNG44yLEI+rGHjQzh2EEzd6jXJbL7uSlyYxvbLGTfLau9bsewyHF7kRcKCfSV4SWUjgKYcoznbUU2lyJBJbkM0+YTqgKpUjV2ZgreQ1XPZHIElrX';
        IconData += 'TdG9Gr3nCSB6UVt6EJ/RKt1daph+WiUVngdWq1zc/uBXbIpElkCSfq1+fWgo4ZOEArNM3uIiKtO4nLSP23E5m9BVS+5qkRY42AkMAVN0xnN52mDqr';
        IconData += 'ZNbahhY8xS6QBarXOIxTYdHXCDJJw0TetqbUZnwT7t+eCzyTE+x0eDwQXzOR0kc+8bAtMxxTRZ31qtDoeHVaY3OBr9zLFlUdW2WcaoVI4gGJyHeHx';
        IconData += 'zZCsx6fBFFGf6/s1S6QDm5mbNnyMPcy/iG6ogna/nJYRCC+a9bLWQwLYPkNcJTGRwjWXanf27+fwLiESWHBGPlnc1Hp4LyGafgyC8hI2NNYjHN6+V';
        IconData += '7KEP0H7Wt1KpMv3OBIIgwKtXStfPRd9XXde5sGDDxMHkEGo2z0GSJvt+uEli0cPSXpWNbTTOIJvdA0n69Udl/8sun/Wyp6CcHWG6uZ66rkO5/Bpis';
        IconData += 'c8hmXw8dLP9oAlETdPhq69edn0vvSaGAgHBIqx37rl7TB84PGSiuSEwLe/ipQy0oRxShUQiCalUukOMnMT0JNtKUC6/HugBsBImGJyHfD5nm1k+PX';
        IconData += '0H2exz+NWvfv2xgaM98Gega7G9rr91zrfzsDnq6R4PqlTJKwIBwRx1HFZqaCpdaGJhhhVQmwRx8/kXXTf1CYIAq6vLIMtbpkcRjX7G/Hw+/6LvlFA';
        IconData += '+/4L5+5nMthlrqmobDg+POlx1MghfLO7DyorxHnq5qtaD5P37S1svqNE4Y2J5stFeVdtw716K+VzFYsH2mvV6Xe9Y4fmPEjuTJzB3wwzeIbBmu6lP';
        IconData += 'FGcgk3kEr14pkMlsM0QIBARmgdbp6bue9dZG44yx6LHYLYaIojgLsrwF5bICmcwj2+y93aRQL/cZACCVSkMsJkOlUjVJp2k60+AhCFezwuR90PE5P';
        IconData += 'TOsqm3IZvfgzh2ZGUtstS64Fk3vBrrENmkvggsL7MUEFl0TJG6yLN/t6/5L0jrTzqgo+7CxsW6b+KHjyX6D8ZK0DpK0Dqrahq++eslYyn7vibiF9G';
        IconData += 'FE1oQKwkuzF9na3ki/53h8EyqVqumKl0oHEAgIUKu96Rq/B4PzoGma5/TOeMrRcGeBe6kX8gaaGIFAYODYnVa50HW9I8NMiE3HpYPK4IjiLHMIBoP';
        IconData += 'zfX8vHt+E7777FjKZRx0dUcZy7SPGcobDi7bTOHR9W9d1KBRe2pJXktZAUfJQLBY8mbCcm5vhJgzgzgLTF4d3BIMLAHDk2JUSxdmPM7P7pptbqVSZ';
        IconData += 'h5l2rVdWnE3+0G1+TjwaYsUN171qm5CzHkBsbLjAfC5raCFJ6xCPb3peYZS+T5MOAX7M88XxkgXWdf3jWs/B3r8sbzHJJ+sOXjrWpOPmQUDrYQ2T0';
        IconData += 'SftlrK8BaXSARweXsX6icRWz89IXGk6tIjHb0+tOIO1g833BPYS7MTPJWnwA8gYjk/3JbqTQ40eyRyWwPRhmko9AFm+C7XaGzg+rvcd7QsEBMhkts';
        IconData += '2h92lcBctTLZiLGJi+CF5yoYmFsQsFBrV03SaFSPzqVPmBfg+CIIyEQIGAAJK0PvB+3khkCVKpB1O7x5mnEIALC0y7IV676XSD/jCn8aiXVtPdTTi';
        IconData += 'SOf24gZdgdHEwD3VNnKlGAiOuGQdPCqraZmq1OFPtHnhpp0QCWwhQq9UdWVFrg/4kkxp09nkYC2xVmkT0OrjnuSAwZqEplEoHZsNCMDhv9hzTaolW';
        IconData += '0N1HBgnewqSG0a0yL9nsXlfxAFVtM8qU5DMMqkyJ4ANIYAr0+kiilkjvKKblTw2FwmpH/bbXFj63EY1+xtRsaZVJWkLWbg3K1YF05Lh0hUACTxyVS';
        IconData += 'rXnmJyu63ByUoeTk7o50G2FMTI4OQJHIktQKOQY8bhK5ahrR1Wvg4wXKVcExsADPrRXg/BErXFlZZlZc9kL2eyTiZL3KjZbgEIhN/D7pj8rfZghBs';
        IconData += 's3THp6Di0wGIknuul+Y2OdIeNVnGj83+p+ZjKPuGoVJCS2yriSMIAOBeiYmEwwqeol1Gp13E3VA+S6IoE5gHULntWShkILTElGVdvQbF5Ao/EWQqE';
        IconData += 'FLixvNxKXywd9E3HG5zaWoZGDrFT6LyQwxsCDgR4hdDIQMApYt+ANQkZjFniW+wc8FFpwlFGOx2+bBDYUJ9qYzEICD/agEfetm5yLm7Ev7WbSq0jG';
        IconData += 'cXjQQuZ2Vr+f5RwlotFlRqSgVDqAVOoBssTmviGBOXSfV1aWx0IWVW2Douz3zA7TMfnKyjLE45tjaY2kl6EdHh4hgbvkTOiDdpLgLgs9qJLiKGBNS';
        IconData += 'I1j56ui7EMs9rmj0s7JSR1SqTSk009dP/1pD8RQ48CM9KDhn28tMC2W/f79+FrTaNULUZxx1cJpmg7J5GOma4sgHF6ESORTy+HytkOO5uSkDolEEr';
        IconData += 'LZJ66d/KI4C5K0Zh4wpdIBl0k6XozMpEcLuXOhx6VwQJdNAABisc2xklcQBIjHN3tIzGyBphlLucmSbuN9X0IymYZCIecaiSVp3SRwq3XhyQ0KboI';
        IconData += '2MuhCw2T2rtJtkyQWdmuSyEreYHAevv4636Hs2OmeCR9j0gIjCq/rOiSTaVfc6WbzvGNrBJ0nQIw3zPNgDDweF9pKHFW9hFQqDdns3kiJYVWXlKQ1';
        IconData += 'x2qMRKbGSmI7NcvreAmKsg+ynOpw3bGUZLXA/GwR4YbARJpmXASOxzehXP5thxh6pXIEd+7II0nekJWitOW9zqSPlcQnJ/WReA2NxhkkEskONclwe';
        IconData += 'BEUJY990R1eCh9tlFwReBJq96I4C4XCM8hkHjG9w7quQzb7HJLJx9dyl0qlA6bGPAr5HENraoay8N8M/bc0TYd0+imkUmnm4BQEAZLJ+1AoPMPY1+';
        IconData += 'aa8dJGyRWBaTdt3DGGJK3Dq1cKY90AjFpsLPY5syZk2DhbktZGJjBHW0TSMTXM4XLnjswk8sj7fPVKGUtJzZvWl6891twQeBKJLLs4M5/PdWwnKBb';
        IconData += '3IRaTHRHFKu86yiy3JK0zHgPdCjoIksnHUCi8ZN6fKM5APp+DTGbb88LrboK3NUDcEJgXrV2jJl2ARGKLIYmqXjqqUVs33o/6ZrNies6uF52kEgQB';
        IconData += 'EgljQRqK4DmzwMZmDiSwaQFJTNFtGdY4IctbHTGrkweczmS7ESvRBwKdFXWKXO4JJqkcgD4s0QJbQJ9o0ySuZu2ymny+YQaZOARo1U+7Va6+J7DXt';
        IconData += '7d7BX/5i44X4ZrxLy+HMhK4z4nbzS12duPfcvUgsnuA28jMIQjMS3mNKwKHQgtm4sha3hgnyDZ6q+KkE7eezuRa9ZpH8zC9HcnDlM0+H3n3mR8IzI';
        IconData += 'uYA3etlKuryxO1wpVK9WMnFtsrHQ4vOlq8Zl09OsqYXtN0JtHnlMDWevcou88w/vU5gekHv1Z7M9YblEw+hmz2eYcQHOlKctKIEQotMMmiUQ4E0O2';
        IconData += 'ZhjX4zNHvk3o3/f7o7jPcztAJutbu9Hr7isD0xanVxuNGkyF7a/nqul1J9BxtpXI0Eo9C03SGwJK0NlTjRSSyBOWyAokEW0I6PX0HspwCRdlHt9ri';
        IconData += 'mdkZGSSwTexIOqFU9dJVa9BonEEsJnc08Y+qKyke32SaQUYRa6bT/znSDi9Z3rId6igW9yGRSI7tEOXdfSYTZW405UwVgTstlztxmaLsdzTxA8BIu';
        IconData += '5KsfcvGMP7joUmcze4xXkIsdmskD1O3oQ5VvYRM5ink8y/QfTY9RL6USLkkMJ3IcssCWC1rOLwI5fJvR96VFI9vMlsPWq0Lx3Emic/pxFowOA+yfH';
        IconData += 'fkB+erVwrzfhGsEeFNXohLAovirOtutHUJWSTyqWuD6zs728yARKt1AbKcgmx2r+dnU9U25PMv4N49dsg+GJyHQuGZK0MHgYDQcW38PJnEs/sMwLG';
        IconData += 'sbDy+adZhy+WDka+8NORqrsTbKpWqaz3BgYAAhcIz2N3dY+rbZPGYKM58FNUzunuazXPmwaHhJnkJSqX/YjwTPytysCOh/In7cbvcjM5GHx/XXcmI';
        IconData += '0gkgsg/ILQQCAuRyTyCZvN+xeExVL+H09B0Ui/tQLO7DyUndlryJxBYUiwVXyauq7Y49Ueg+k2uxhgR2aiEBjBqlGzXhUGiBcW1py+OmZ/HqlVG+G';
        IconData += 'WSoQBCM6+BGfG5vfQ8sr+1fAtdqdaZ5g0dPhOvNDLS8qaLsu/Iw0a76uPYBkey0LG+Zmw817apbi8RZZCnZpFxGv6ty0Ac6r54I1wSORJYgGJyHVu';
        IconData += 'sCVPUSGo2zkT/Q0ehnIAhX6hTj3gdk3Xw4aXdxUnuieAMdSthtrEQX2oGFJLiOgFsva0g/qIeHR33j7UbjDBRlH9JpvmuklUoVksnHoCj7ppUf1H0';
        IconData += 'e154oXkHroPEcRnC/3EyS1uGrrwwLeXr6zpUtAYbE7Gsm3iY3zbpB0E4thMcdwbVanQkNyOqaYHCeWfBNSNpsnjOJMz8nr1S1bYZuZIMGEviaBCPt';
        IconData += 'jm6UlKzLrYnFsj7U3UCIwguJm83zrqLvrdYF85nITihalkcUZ3y93Ju2vqury1yL/N3wCoFJ6aVSOXJlCD0ev02dwJdQqRz1JK81g5zNPudiHM9wm';
        IconData += '9MdipPdrY3xWWnPws+ZZ9r6AgD3emF/88UX//4l7xf15s2b8MMPH+D09My0MKN28T755GdQqVS7xonB4Dysra3CP/1TDP7lX/4XyPJdmJubYWrHtV';
        IconData += 'odNE2DX/7yHyZG3mz2OXz48IEi4xoUCs8gHt+EX/zi5/B3f/czAPhrzw0YudwTuHnzpi8JnM+/NA9uSVrj/jDzzILveHzT3HRwevrOlYw0WW4tCAI';
        IconData += 'TJ3Z7HXJzaeWOSc7SWl9bktbMcCMQECAaXf7oGm+ZP99onEGjcQat1jmo6uXQ44lofSeDH/3ww//81UuxCYmFw+FFKBSejfTva5oO79+3HSfJEomk';
        IconData += 'eWonElsTu/G1Wh0ymafU179z/ACTnIAfkU4/NVtdJ3kfpy4Gpk9EWjt61DFnICA4Jq+m6UysPMlhb+trOxUQEMVZ35K30Tgzyct75tmzBLa6NTyoR';
        IconData += 'lhJMkkC0+L4wxDYz6Dr+d2XriOBRxKn0qtIrfpQk4w7rTuVBrXgdkQjE0nXscK8ydnyilLpgBkZ9NKmih978YKnUg9AllMAYEi/RKPLE2tHpEkyjP';
        IconData += 'W1jhiyLu2M4+mjSGTJTMS4IWc7bVDVNlP3HXWPAVpgG4RCCxCL3TK/zmb3JvZe6PqpU7X+Wq3eU/96GA/DTTnbacTu7p5ZM19ZWfbcgrcbXr3wsnz';
        IconData += 'XjPdarYuhd/iOMv4NhQZ3oTVNH6iPuljcd0RCUZxl5o0xDu7tOpMDWBAE2NnZ9txn8CyByT7fYR/0Uce/hqrG4BlcRfmGaabI53NQq/0OarXfQbn8';
        IconData += 'W4aETgcmrrN61K+u88OH9z1Z/77h5ZsQiSx1uNLjzEqzy66WHBGfDE8AGA0X9O+L4ixTxjg9fefIlcYlcc5dZ6+2j97w+o2wutLjHO+jydFonA1cl';
        IconData += '6ZjdkEQbOePZXmLyWoPWjKr1eqMeomqXqJAe4f3s+9513lqCBwICJDNXi3iNoTi3B8qUNW2ZcvfJWSzz+FXv/o15PMvupaAFGWfafyQ5a2urhtNbF';
        IconData += '3Xu04YkW0NsZgMmczTjpFHtMLstaCF/Hd2tj3dOuqJYYZ++OlPfwKBgAC///0fAADgD384g1/+8h/gpz/9iYuv+iO4efMmqGqbsXAfPnyA77//I5T';
        IconData += 'Lr6HZPIe//dub8MknPzNJv7t7NWwQDi/Cv/3b/+76CnNzs6BpGnz//R8BAOBPf/pviESWYG5ulnkYv/zyN/D73/+hw9IKggC3b0sfR+ICvievpunw';
        IconData += 'z//8f8zrH4vd8rxskKd6ofuB7mUdh/zqldWvwuFh1XbY34hpDUkWqyCAouT71q81TYc7d2TT2pNGA7r5wIpgcB7i8U2IRj/z7WCC3XVMJh+b1ywYn';
        IconData += 'IdiseD5zzVVBNY0HRKJJKMkOOqBh35udal0AIeHR4x7bQcnzfLWIYVuIONvXqtljgPZ7B6jsvH11/mp6PueKgIDGBleeqCdHqkb50FSq73paiWH6b';
        IconData += 'BKJh/bWnhi3b3Uvztu0FNsg3o+SOAJwmqxksn7E4t1SHaanjPN59Jb2MYAAAQASURBVHOOraSqtuHevRRT+tjYWPe19M2g4Q09r53JPJoqxZGpJDC';
        IconData += 'PN07TdDg8rIKqtoeWrS2VDkBV2xCPb/paMXLYgzwWuzVWyWAk8Ajjnmk8fRF8h1JIYCQxYgTknZaMsx1uTPvNzGS2zR1LBqH5UI9EjI+846xEIIFd';
        IconData += 'QCr1gGlLRBL7i7zTnJ33BYHJfl4k8fTCqoftB/L6IgamQWZw6Zh4kiUmxOjIS1cc/EJe3xH4yvqyia1pzVD6AdYmjXB4EXK5L3zT1OJLAtuR2G83f';
        IconData += 'hq9KT8exL4lMIDRGFEovGRcr0xme2ra7KYVqtqGdPop06Y6jU0aSOABUKvVGXUGQRDg4cP7WCvmFI3GGaTTT5lhET/X9n1PYACj/JDJPGU0qmKxWy';
        IconData += 'DLd9Gl5jjeFQQBCoWcrz0mJDAVU1k1mtGl5tdl9lOmGQl8jVMewDuLrqY1T6Eo+4zL7Nd4Fwl8DZcarfH4re7u7h4zAy0IAuRyT1CwAAk8mEutKN8';
        IconData += 'w8q/EGuPwvPteENkFTbCysux5ATok8ARQq9U/qkxeWWNRnIFU6gEO048YjcYZZLN7zLUmsq94rZHAI7fG4fAiyPJddOlccJcBjMaMVOoBWl0k8Ohi';
        IconData += '43z+he2DZiwfR5UMp8RVlH2mm4p4OJnMNh6MSGB3UKlUQVH2GVcPiXx94gqCALK8hcMlSODxuNWl0kFHsgXASLjE45toQWw8mHL5wJa48fgmJgeRw';
        IconData += 'HwRmQis+70ts5fwPca5SGDuiSwIAqyuLkMstumbOnIvkXticTc21jDcQALzR+Ra7Y1tjAxgJGhisU1YXV2euodXVdtwfFyHSqXaVdA+FtuEjY11tL';
        IconData += 'hIYP5hJ+pudbEjkSWQpHXPWuZm89xcadptVxOK0COBPW+VDw+rXS0TcSsjkSXzP14JraptaDTOoNE4g+PjetcdUNPsaSCBfYx+biZN6FBoHiKRTyE';
        IconData += 'UWgBRnBk7qVW1Dc3mBTSb59BovIVm86Ln0jZRnIFodNnTHgUSGOGYzMSi9dtoSNzuQECASORTAACzVBUICI5J02yemzuFyRJw43ta11Wpdu5xJLKE';
        IconData += 'lhYJjCBENizeYIQeJ2ivgLj6CCQwYgAXttk8B1Vt93S7Rwna0odCCxAKzaOFRQIjRkXs9+8vQdN0aDbPqe+1Hf2dublZk5RzczMgirPm/xFIYAQC4';
        IconData += 'TJu4CVAIJDACAQCCYxAIJDACAQSGIFAIIERCAQSGIFAIIERCCQwAoFAAiMQCCQwAoEERiAQSGAEAoEERiAQSGAEAgmMQCCQwAgEAgmMQCCQwAgEEh';
        IconData += 'iBQCCBEQgEEhiBQAIjEAgkMAKBQAIjEAgkMAKBBEYgEEhgBAKBBEYgEEhgBAIJjEAgJoX/D5PJL0xH01oxAAAAAElFTkSuQmCC';
        exit(IconData);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateJobOverBudgetValue()
    var
        Job: Record Job;
        UPGJob: Record "UPG Job";
        JobTask: Record "Job Task";
        JobLedgerEntry: Record "Job Ledger Entry";
        JobPlanningLine: Record "Job Planning Line";
        UsageCost: Decimal;
        ScheduleCost: Decimal;
    begin
        if UPGJob.FindSet then
            repeat
                UsageCost := 0;
                ScheduleCost := 0;
                JobTask.SetRange("Job No.", UPGJob."No.");
                if JobTask.FindFirst then begin
                    JobLedgerEntry.SetFilter("Job No.", '%1', UPGJob."No.");
                    if JobLedgerEntry.FindSet then begin
                        repeat
                            UsageCost := UsageCost + JobLedgerEntry."Total Cost (LCY)";
                        until JobLedgerEntry.Next = 0;
                    end;

                    JobPlanningLine.SetFilter("Job No.", '%1', UPGJob."No.");
                    JobPlanningLine.SetFilter("Schedule Line", '=1');
                    if JobPlanningLine.FindSet then begin
                        repeat
                            ScheduleCost := ScheduleCost + JobPlanningLine."Total Cost (LCY)";
                        until JobPlanningLine.Next = 0;
                    end;

                    if Job.Get(UPGJob."No.") then begin
                        if UsageCost > ScheduleCost then
                            Job."Over Budget" := true
                        else
                            Job."Over Budget" := false;
                        Job.Modify;
                    end;
                end;
            until UPGJob.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateSalesInvCrMemoCancellationInfo()
    var
        UPGSalesInvoiceHeader: Record "UPG Sales Invoice Header";
        UPGSalesCrMemoHeader: Record "UPG Sales Cr.Memo Header";
        CancelledDocument: Record "Cancelled Document";
    begin
        UPGSalesInvoiceHeader.SetFilter("Canceled By", '<>%1', '');
        if UPGSalesInvoiceHeader.FindSet then
            repeat
                if UPGSalesCrMemoHeader.Get(UPGSalesInvoiceHeader."Canceled By") then
                    CancelledDocument.InsertSalesInvToCrMemoCancelledDocument(UPGSalesInvoiceHeader."No.", UPGSalesCrMemoHeader."No.");
            until UPGSalesInvoiceHeader.Next = 0;
    end;

    local procedure CreateItemCategory(ProductGroup: Record "Product Group")
    var
        UPGItem: Record "UPG Item";
        ItemCategory: Record "Item Category";
        Item: Record Item;
        NewItemCategoryCode: Code[10];
    begin
        NewItemCategoryCode := GetUniqueItemCategoryCode(ProductGroup);

        ItemCategory.Init;
        ItemCategory.Code := NewItemCategoryCode;
        ItemCategory."Parent Category" := ProductGroup."Item Category Code";
        ItemCategory.Description := ProductGroup.Description;
        ItemCategory.Insert;

        UPGItem.SetRange("Item Category Code", ProductGroup."Item Category Code");
        UPGItem.SetRange("Product Group Code", ProductGroup.Code);
        if UPGItem.FindSet then
            repeat
                Item.Get(UPGItem."No.");
                Item."Item Category Code" := NewItemCategoryCode;
                Item.Modify(true);
                UpdateItemCategoryCodeOnLinesRecords(UPGItem, ItemCategory);
            until UPGItem.Next = 0;
    end;

    local procedure SaveWarehouseClassCode(ProductGroup: Record "Product Group")
    var
        Item: Record Item;
        UPGItem: Record "UPG Item";
        UPGNonstockItem: Record "UPG Nonstock Item";
        NonstockItem: Record "Nonstock Item";
        TempItemTemplateCode: Code[10];
    begin
        UPGItem.SetRange("Item Category Code", ProductGroup."Item Category Code");
        UPGItem.SetRange("Product Group Code", ProductGroup.Code);
        if UPGItem.FindSet then
            repeat
                Item.Get(UPGItem."No.");
                Item."Warehouse Class Code" := ProductGroup."Warehouse Class Code";
                Item.Modify;
            until UPGItem.Next = 0;

        UPGNonstockItem.SetRange("Product Group Code", ProductGroup.Code);
        UPGNonstockItem.SetRange("Item No.", '');
        if UPGNonstockItem.FindSet then begin
            CreateItemTemplateFromProductGroup(ProductGroup, TempItemTemplateCode);
            repeat
                NonstockItem.Get(UPGNonstockItem."Entry No.");
                NonstockItem.Validate("Item Template Code", TempItemTemplateCode);
                NonstockItem.Modify;
            until UPGNonstockItem.Next = 0;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdatePurchInvCrMemoCancellationInfo()
    var
        UPGPurchInvoiceHeader: Record "UPG Purch. Inv. Header";
        UPGPurchCrMemoHeader: Record "UPG Purch. Cr. Memo Hdr.";
        CancelledDocument: Record "Cancelled Document";
    begin
        UPGPurchInvoiceHeader.SetFilter("Canceled By", '<>%1', '');
        if UPGPurchInvoiceHeader.FindSet then
            repeat
                if UPGPurchCrMemoHeader.Get(UPGPurchInvoiceHeader."Canceled By") then
                    CancelledDocument.InsertPurchInvToCrMemoCancelledDocument(UPGPurchInvoiceHeader."No.", UPGPurchCrMemoHeader."No.");
            until UPGPurchInvoiceHeader.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeIntrastatJnlLine()
    var
        IntrastatJnlLine: Record "Intrastat Jnl. Line";
        UpgradeTags: Codeunit "Upgrade Tags";
        UpgradeTagMgt: Codeunit "Upgrade Tag Mgt";
    begin
        if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetIntrastatJnlLinePartnerIDUpgradeTag) then
            exit;

        IntrastatJnlLine.SetRange(Type, IntrastatJnlLine.Type::Shipment);
        if IntrastatJnlLine.FindSet then
            repeat
                IntrastatJnlLine."Country/Region of Origin Code" := IntrastatJnlLine.GetCountryOfOriginCode;
                IntrastatJnlLine."Partner VAT ID" := IntrastatJnlLine.GetPartnerID;
                IntrastatJnlLine.Modify;
            until IntrastatJnlLine.Next = 0;

        UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetIntrastatJnlLinePartnerIDUpgradeTag);
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure UpgradeCustomReportLayout()
    var
        UPGCustomReportLayout: Record "UPG Custom Report Layout";
        CustomReportLayout: Record "Custom Report Layout";
    begin
        UPGCustomReportLayout.SetAutoCalcFields(Layout, "Custom XML Part");
        if not UPGCustomReportLayout.FindSet then
            exit;

        repeat
            Clear(CustomReportLayout);
            CustomReportLayout.TransferFields(UPGCustomReportLayout, false);
            CustomReportLayout.Code := GetReportLayoutCode(UPGCustomReportLayout.ID);
            CustomReportLayout.Insert(true);
        until UPGCustomReportLayout.Next = 0;
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure UpgradeReportLayoutSelection()
    var
        UPGReportLayoutSelection: Record "UPG Report Layout Selection";
        ReportLayoutSelection: Record "Report Layout Selection";
    begin
        if not UPGReportLayoutSelection.FindSet then
            exit;

        repeat
            ReportLayoutSelection.Get(UPGReportLayoutSelection."Report ID", UPGReportLayoutSelection."Company Name");
            ReportLayoutSelection."Custom Report Layout Code" := GetReportLayoutCode(UPGReportLayoutSelection."Custom Report Layout ID");
            ReportLayoutSelection.Modify;
        until UPGReportLayoutSelection.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeCustomReportSelection()
    var
        UPGCustomReportSelection: Record "UPG Custom Report Selection";
        CustomReportSelection: Record "Custom Report Selection";
    begin
        if not UPGCustomReportSelection.FindSet then
            exit;

        repeat
            CustomReportSelection.Get(
              UPGCustomReportSelection."Source Type", UPGCustomReportSelection."Source No.",
              UPGCustomReportSelection.Usage, UPGCustomReportSelection.Sequence);

            CustomReportSelection."Custom Report Layout Code" := GetReportLayoutCode(UPGCustomReportSelection."Custom Report Layout ID");
            CustomReportSelection.Modify;
        until UPGCustomReportSelection.Next = 0;

        CustomReportSelection.ModifyAll("Use for Email Attachment", true);
    end;

    local procedure GetReportLayoutCode(ID: Integer): Code[20]
    var
        UPGCustomReportLayout: Record "UPG Custom Report Layout";
        DummyCustomReportLayout: Record "Custom Report Layout";
        NewCode: Code[20];
        NonPaddedCode: Code[20];
        PaddingStringLength: Integer;
    begin
        if ID <= 0 then
            exit('');

        UPGCustomReportLayout.Get(ID);
        NonPaddedCode := StrSubstNo('%1-%2', UPGCustomReportLayout."Report ID", ID);
        PaddingStringLength := MaxStrLen(DummyCustomReportLayout.Code) - StrLen(NonPaddedCode);

        if PaddingStringLength > 0 then
            NewCode := StrSubstNo('%1-%2%3', UPGCustomReportLayout."Report ID", PadStr('', PaddingStringLength, '0'), ID)
        else
            NewCode := NonPaddedCode;

        exit(NewCode);
    end;

    [Normal]
    local procedure CreateItemTemplateFromItemCategory(UPGItemCategory: Record "UPG Item Category"; var ItemTemplateCode: Code[10])
    var
        TempItemTemplate: Record "Item Template" temporary;
    begin
        Clear(TempItemTemplate);
        TempItemTemplate.Validate(Code, GetUniqueItemTemplateCodeFromItemCategory(UPGItemCategory));
        if UPGItemCategory.Description <> '' then
            TempItemTemplate.Validate("Template Name", UPGItemCategory.Description)
        else
            TempItemTemplate.Validate("Template Name", UPGItemCategory.Code);
        TempItemTemplate.Insert(true);
        TempItemTemplate.Validate("Gen. Prod. Posting Group", UPGItemCategory."Def. Gen. Prod. Posting Group");
        TempItemTemplate.Validate("Inventory Posting Group", UPGItemCategory."Def. Inventory Posting Group");
        TempItemTemplate.Validate("VAT Prod. Posting Group", UPGItemCategory."Def. VAT Prod. Posting Group");
        TempItemTemplate.Validate("Costing Method", UPGItemCategory."Def. Costing Method");
        TempItemTemplate.Validate("Tax Group Code", UPGItemCategory."Def. Tax Group Code");
        TempItemTemplate.Modify(true);
        ItemTemplateCode := TempItemTemplate.Code;
    end;

    [Normal]
    local procedure CreateItemTemplateFromProductGroup(ProductGroup: Record "Product Group"; var ItemTemplateCode: Code[10])
    var
        UPGItemCategory: Record "UPG Item Category";
        TempItemTemplate: Record "Item Template" temporary;
    begin
        Clear(TempItemTemplate);
        TempItemTemplate.Validate(Code, GetUniqueItemTemplateCodeFromProductGroup(ProductGroup));
        if ProductGroup.Description <> '' then
            TempItemTemplate.Validate("Template Name", ProductGroup.Description)
        else
            TempItemTemplate.Validate("Template Name", ProductGroup.Code);
        TempItemTemplate.Insert(true);
        UPGItemCategory.Get(ProductGroup."Item Category Code");
        TempItemTemplate.Validate("Gen. Prod. Posting Group", UPGItemCategory."Def. Gen. Prod. Posting Group");
        TempItemTemplate.Validate("Inventory Posting Group", UPGItemCategory."Def. Inventory Posting Group");
        TempItemTemplate.Validate("VAT Prod. Posting Group", UPGItemCategory."Def. VAT Prod. Posting Group");
        TempItemTemplate.Validate("Costing Method", UPGItemCategory."Def. Costing Method");
        TempItemTemplate.Validate("Tax Group Code", UPGItemCategory."Def. Tax Group Code");
        TempItemTemplate.Validate("Warehouse Class Code", ProductGroup."Warehouse Class Code");
        TempItemTemplate.Modify(true);
        ItemTemplateCode := TempItemTemplate.Code;
    end;

    [Normal]
    local procedure GetUniqueItemTemplateCodeFromProductGroup(ProductGroup: Record "Product Group"): Code[10]
    var
        DummyConfigTemplateHeader: Record "Config. Template Header";
        ItemTemplateCode: Code[10];
    begin
        ItemTemplateCode := GetUniqueItemTemplateCode(CopyStr(ProductGroup.Code, 1, MaxStrLen(DummyConfigTemplateHeader.Code)));
        if ItemTemplateCode = '' then
            Error(UnableToUpgradeProductGroupErr, ProductGroup."Item Category Code", ProductGroup.Code);

        exit(ItemTemplateCode);
    end;

    [Normal]
    local procedure GetUniqueItemTemplateCodeFromItemCategory(UPGItemCategory: Record "UPG Item Category"): Code[10]
    var
        DummyConfigTemplateHeader: Record "Config. Template Header";
        ItemTemplateCode: Code[10];
    begin
        ItemTemplateCode := GetUniqueItemTemplateCode(CopyStr(UPGItemCategory.Code, 1, MaxStrLen(DummyConfigTemplateHeader.Code)));
        if ItemTemplateCode = '' then
            Error(UnableToUpgradeItemCategoryErr, UPGItemCategory.Code);

        exit(ItemTemplateCode);
    end;

    [Normal]
    local procedure GetUniqueItemTemplateCode(CandidateCode: Code[10]): Code[10]
    var
        ConfigTemplateHeader: Record "Config. Template Header";
    begin
        if not ConfigTemplateHeader.Get(CandidateCode) then
            exit(CandidateCode);

        if StrLen(CandidateCode) < MaxStrLen(CandidateCode) - 2 then
            CandidateCode += '1'
        else
            CandidateCode := CopyStr(CandidateCode, 1, StrLen(CandidateCode) - 2) + '1';

        while ConfigTemplateHeader.Get(CandidateCode) do
            if StrLen(IncStr(CandidateCode)) < MaxStrLen(CandidateCode) then
                CandidateCode := IncStr(CandidateCode)
            else
                exit('');

        exit(CandidateCode);
    end;

    [Normal]
    local procedure GetUniqueItemCategoryCode(ProductGroup: Record "Product Group"): Code[10]
    var
        ItemCategory: Record "Item Category";
        CandidateCode: Code[10];
    begin
        CandidateCode := ProductGroup.Code;
        if not ItemCategory.Get(CandidateCode) then
            exit(CandidateCode);

        if StrLen(CandidateCode) < MaxStrLen(CandidateCode) - 2 then
            CandidateCode += '1'
        else
            CandidateCode := CopyStr(CandidateCode, 1, StrLen(CandidateCode) - 2) + '1';

        while ItemCategory.Get(CandidateCode) do
            if StrLen(IncStr(CandidateCode)) < MaxStrLen(CandidateCode) then
                CandidateCode := IncStr(CandidateCode)
            else
                Error(UnableToUpgradeProductGroupErr, ProductGroup."Item Category Code", ProductGroup.Code);

        exit(CandidateCode);
    end;

    [Normal]
    local procedure ModifyNonStockItemTemplateCode(UPGNonstockItem: Record "UPG Nonstock Item"; ItemTemplateCode: Code[10])
    var
        NonstockItem: Record "Nonstock Item";
    begin
        if UPGNonstockItem.FindSet then
            repeat
                NonstockItem.Get(UPGNonstockItem."Entry No.");
                if NonstockItem."Product Group Code" = '' then begin
                    NonstockItem."Item Template Code" := ItemTemplateCode;
                    NonstockItem.Modify;
                end;
            until UPGNonstockItem.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateDataExchUnitOfMeasureMapping()
    var
        PurchaseLine: Record "Purchase Line";
    begin
        UpdateDataExchColumnDefRecord(
          'OCRINVOICE', 'OCRINVLINES', 'InvoiceLineUnitOfMeasure',
          '', '/Document/Tables/Table/TableRows/TableRow/ItemFields/ItemField[Type[text()=''LIT_DeliveredQuantityUnitCode'']]/Text');
        UpdateDataExchFieldMappingRecord(
          'OCRINVOICE', 'OCRINVLINES',
          DATABASE::"Purchase Line", PurchaseLine.FieldNo("Unit of Measure"),
          DATABASE::"Purchase Line", PurchaseLine.FieldNo("Unit of Measure Code"));
        UpdateDataExchFieldMappingRecord(
          'PEPPOLINVOICE', 'PEPPOLINVLINES',
          DATABASE::"Purchase Line", PurchaseLine.FieldNo("Unit of Measure"),
          DATABASE::"Purchase Line", PurchaseLine.FieldNo("Unit of Measure Code"));
        UpdateDataExchFieldMappingRecord(
          'PEPPOLCREDITMEMO', 'PEPPOLCRMEMOLINES',
          DATABASE::"Purchase Line", PurchaseLine.FieldNo("Unit of Measure"),
          DATABASE::"Purchase Line", PurchaseLine.FieldNo("Unit of Measure Code"));
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure InsertDataExchVendorIdMapping()
    var
        Vendor: Record Vendor;
    begin
        InsertDataExchColumnDefRecord(
          'OCRINVOICE', 'OCRINVHEADER', 18, 'Supplier ID', 'Buy-from Vendor ID',
          '/Document/Parties/Party[Type[text()=''supplier'']]/ExternalId', '');
        InsertDataExchColumnDefRecord(
          'OCRCREDITMEMO', 'OCRCRMEMOHEADER', 18, 'Supplier ID', 'Buy-from Vendor ID',
          '/Document/Parties/Party[Type[text()=''supplier'']]/ExternalId', '');
        InsertDataExchFieldMappingRecord(
          'OCRINVOICE', 'OCRINVHEADER', 18,
          DATABASE::"Intermediate Data Import", 0, DATABASE::Vendor, Vendor.FieldNo(Id),
          '', true);
        InsertDataExchFieldMappingRecord(
          'OCRCREDITMEMO', 'OCRCRMEMOHEADER', 18,
          DATABASE::"Intermediate Data Import", 0, DATABASE::Vendor, Vendor.FieldNo(Id),
          '', true);
    end;

    local procedure DoesDataExchLineExist(DataExchDefCode: Code[20]; "Code": Code[20]): Boolean
    var
        DataExchLineDef: Record "Data Exch. Line Def";
    begin
        DataExchLineDef.SetRange("Data Exch. Def Code", DataExchDefCode);
        DataExchLineDef.SetRange(Code, Code);
        exit(DataExchLineDef.FindFirst);
    end;

    local procedure DoesDataExchMappingExist(DataExchDefCode: Code[20]; DataExchLineDefCode: Code[20]): Boolean
    var
        DataExchMapping: Record "Data Exch. Mapping";
    begin
        DataExchMapping.SetRange("Data Exch. Def Code", DataExchDefCode);
        DataExchMapping.SetRange("Data Exch. Line Def Code", DataExchLineDefCode);
        exit(DataExchMapping.FindFirst);
    end;

    local procedure InsertDataExchColumnDefRecord(DataExchDefCode: Code[20]; DataExchLineDefCode: Code[20]; ColumnNo: Integer; Name: Text[250]; Description: Text[50]; Path: Text[250]; Constant: Text[30])
    var
        DataExchColumnDef: Record "Data Exch. Column Def";
    begin
        if not DoesDataExchLineExist(DataExchDefCode, DataExchLineDefCode) then
            exit;
        DataExchColumnDef.SetRange("Data Exch. Def Code", DataExchDefCode);
        DataExchColumnDef.SetRange("Data Exch. Line Def Code", DataExchLineDefCode);
        DataExchColumnDef.SetRange("Column No.", ColumnNo);
        if DataExchColumnDef.FindFirst then
            exit;
        DataExchColumnDef.Init;
        DataExchColumnDef.Validate("Data Exch. Def Code", DataExchDefCode);
        DataExchColumnDef.Validate("Data Exch. Line Def Code", DataExchLineDefCode);
        DataExchColumnDef.Validate("Column No.", ColumnNo);
        DataExchColumnDef.Validate(Name, Name);
        DataExchColumnDef.Validate(Description, Description);
        DataExchColumnDef.Validate(Path, Path);
        DataExchColumnDef.Validate(Constant, Constant);
        DataExchColumnDef.Insert;
    end;

    local procedure InsertDataExchFieldMappingRecord(DataExchDefCode: Code[20]; DataExchLineDefCode: Code[20]; ColumnNo: Integer; TableId: Integer; FieldId: Integer; TargetTableId: Integer; TargetFieldId: Integer; TransformationRule: Code[20]; Optional: Boolean)
    var
        DataExchFieldMapping: Record "Data Exch. Field Mapping";
    begin
        if not DoesDataExchMappingExist(DataExchDefCode, DataExchLineDefCode) then
            exit;
        DataExchFieldMapping.SetRange("Data Exch. Def Code", DataExchDefCode);
        DataExchFieldMapping.SetRange("Data Exch. Line Def Code", DataExchLineDefCode);
        DataExchFieldMapping.SetRange("Table ID", TableId);
        DataExchFieldMapping.SetRange("Column No.", ColumnNo);
        DataExchFieldMapping.SetRange("Field ID", FieldId);
        if DataExchFieldMapping.FindFirst then
            exit;
        DataExchFieldMapping.Init;
        DataExchFieldMapping.Validate("Data Exch. Def Code", DataExchDefCode);
        DataExchFieldMapping.Validate("Data Exch. Line Def Code", DataExchLineDefCode);
        DataExchFieldMapping.Validate("Table ID", TableId);
        DataExchFieldMapping.Validate("Column No.", ColumnNo);
        DataExchFieldMapping.Validate("Field ID", FieldId);
        DataExchFieldMapping.Validate(Optional, Optional);
        DataExchFieldMapping.Validate("Target Table ID", TargetTableId);
        DataExchFieldMapping.Validate("Target Field ID", TargetFieldId);
        DataExchFieldMapping.Validate("Transformation Rule", TransformationRule);
        DataExchFieldMapping.Insert;
    end;

    local procedure UpdateDataExchColumnDefRecord(DataExchDefCode: Code[20]; DataExchLineDefCode: Code[20]; ColumnName: Text[250]; NewConstant: Text[30]; NewPath: Text[250])
    var
        DataExchColumnDef: Record "Data Exch. Column Def";
    begin
        DataExchColumnDef.SetRange("Data Exch. Def Code", DataExchDefCode);
        DataExchColumnDef.SetRange("Data Exch. Line Def Code", DataExchLineDefCode);
        DataExchColumnDef.SetRange(Name, ColumnName);
        if DataExchColumnDef.FindFirst then begin
            DataExchColumnDef.Validate(Constant, NewConstant);
            DataExchColumnDef.Validate(Path, NewPath);
            DataExchColumnDef.Modify;
        end;
    end;

    local procedure UpdateDataExchFieldMappingRecord(DataExchDefCode: Code[20]; DataExchLineDefCode: Code[20]; OldTableId: Integer; OldFieldId: Integer; NewTableId: Integer; NewFieldId: Integer)
    var
        DataExchFieldMapping: Record "Data Exch. Field Mapping";
    begin
        DataExchFieldMapping.SetRange("Data Exch. Def Code", DataExchDefCode);
        DataExchFieldMapping.SetRange("Data Exch. Line Def Code", DataExchLineDefCode);
        DataExchFieldMapping.SetRange("Table ID", OldTableId);
        DataExchFieldMapping.SetRange("Field ID", OldFieldId);
        if DataExchFieldMapping.FindFirst then begin
            DataExchFieldMapping.Validate("Table ID", NewTableId);
            DataExchFieldMapping.Validate("Field ID", NewFieldId);
            DataExchFieldMapping.Modify;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateDuplicateSearchStringSetup()
    var
        DuplicateSearchStringSetup: Record "Duplicate Search String Setup";
    begin
        DuplicateSearchStringSetup.DeleteAll;
        DuplicateSearchStringSetup.CreateDefaultSetup;
    end;

    local procedure CreateTenantWebServiceColumn(TenantWebServiceRecordId: RecordID; FieldNumber: Integer; DataItem: Integer)
    var
        TenantWebServiceColumns: Record "Tenant Web Service Columns";
        FieldTable: Record "Field";
        ODataUtility: Codeunit ODataUtility;
        FieldNameConverted: Text;
    begin
        TenantWebServiceColumns.Init;
        TenantWebServiceColumns."Entry ID" := 0;
        TenantWebServiceColumns."Data Item" := DataItem;
        TenantWebServiceColumns."Field Number" := FieldNumber;
        TenantWebServiceColumns.TenantWebServiceID := TenantWebServiceRecordId;
        TenantWebServiceColumns.Include := true;

        if FieldTable.Get(DataItem, FieldNumber) then
            FieldNameConverted := ODataUtility.ConvertNavFieldNameToOdataName(FieldTable.FieldName);

        TenantWebServiceColumns."Field Name" := CopyStr(FieldNameConverted, 1, 250);
        if TenantWebServiceColumns.Insert then;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure CreateJobWebServices()
    var
        TenantWebService: Record "Tenant Web Service";
    begin
        TenantWebService.Init;
        TenantWebService."Object Type" := TenantWebService."Object Type"::Page;
        TenantWebService."Object ID" := PAGE::"Job List";
        TenantWebService."Service Name" := CopyStr(JobListTxt, 1, MaxStrLen(TenantWebService."Service Name"));
        TenantWebService.Published := true;

        if TenantWebService.Insert then begin
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1, DATABASE::Job);
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 3, DATABASE::Job);
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 5, DATABASE::Job);
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 19, DATABASE::Job);
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 20, DATABASE::Job);
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 2, DATABASE::Job);
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1036, DATABASE::Job);

            CreateTenantWebServiceOData(TenantWebService);
        end;

        Clear(TenantWebService);

        TenantWebService.Init;
        TenantWebService."Object Type" := TenantWebService."Object Type"::Page;
        TenantWebService."Object ID" := PAGE::"Job Task Lines";
        TenantWebService."Service Name" := CopyStr(JobTaskLinesTxt, 1, MaxStrLen(TenantWebService."Service Name"));
        TenantWebService.Published := true;

        if TenantWebService.Insert then begin
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 2, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 3, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 4, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 21, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 7, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 6, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 9, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 66, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 67, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 10, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 11, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 12, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 13, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 14, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 15, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 17, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 16, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 64, DATABASE::"Job Task");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 65, DATABASE::"Job Task");

            CreateTenantWebServiceOData(TenantWebService);
        end;

        Clear(TenantWebService);

        TenantWebService.Init;
        TenantWebService."Object Type" := TenantWebService."Object Type"::Page;
        TenantWebService."Object ID" := PAGE::"Job Planning Lines";
        TenantWebService."Service Name" := CopyStr(JobPlanningLinesTxt, 1, MaxStrLen(TenantWebService."Service Name"));
        TenantWebService.Published := true;

        if TenantWebService.Insert then begin
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1000, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 3, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 5794, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 4, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 5, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 7, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 8, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 9, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1060, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1002, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1003, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1004, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1006, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1071, DATABASE::"Job Planning Line");
            CreateTenantWebServiceColumn(TenantWebService.RecordId, 1035, DATABASE::"Job Planning Line");

            CreateTenantWebServiceOData(TenantWebService);
        end;

        CreatePowerBICustomerList;
        CreatePowerBIVendorList;
        CreatePowerBIJobList;
        CreatePowerBISalesList;
        CreatePowerBIPurchaseList;
        CreatePowerBIItemPurchaseList;
        CreatePowerBIItemSalesList;
        CreatePowerBIGLAmountList;
        CreatePowerBIGLBudgetedAmountList;
        CreatePowerBITopCustOverviewWebService;
        CreatePowerBISalesHdrCustWebService;
        CreatePowerBICustItemLedgEntWebService;
        CreatePowerBICustLedgerEntriesWebService;
        CreatePowerBIVendorLedgerEntriesWebService;
        CreatePowerBIPurchaseHdrVendorWebService;
        CreatePowerBIVendItemLedgEntWebService;
        CreatePowerBIAgedAccPayableWebService;
        CreatePowerBIAgedAccReceivableWebService;
        CreatePowerBIAgedInventoryChartWebService;
        CreatePowerBIJobActBudgPriceWebService;
        CreatePowerBIJobProfitabilityWebService;
        CreatePowerBIJobActBudgCostWebService;
        CreatePowerBISalesPipelineWebService;
        CreatePowerBITop5OpportunitiesWebService;
        CreatePowerBIWorkDateCalcWebService;
        CreatePowerBIReportLabelsWebService;
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Chart of Accounts", PowerBIChartOfAccountsTxt, true);
    end;

    local procedure CreateTenantWebServiceOData(TenantWebService: Record "Tenant Web Service")
    var
        TenantWebServiceOData: Record "Tenant Web Service OData";
        ODataUtility: Codeunit ODataUtility;
        SelectText: Text;
    begin
        TenantWebServiceOData.Init;
        TenantWebServiceOData.TenantWebServiceID := TenantWebService.RecordId;
        if not TenantWebServiceOData.Insert then;
        ODataUtility.GenerateSelectText(TenantWebService."Service Name", TenantWebService."Object Type", SelectText);
        TenantWebServiceOData.SetOdataSelectClause(SelectText);
        TenantWebServiceOData.Modify;
    end;

    local procedure CreatePowerBICustomerList()
    var
        TenantWebService: Record "Tenant Web Service";
        Customer: Record Customer;
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Customer List", PowerBICustomerListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBICustomerListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Customer.FieldNo("No."), DATABASE::Customer);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Customer.FieldNo(Name), DATABASE::Customer);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Customer.FieldNo("Credit Limit (LCY)"), DATABASE::Customer);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Customer.FieldNo("Balance Due"), DATABASE::Customer);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedCustLedgEntry.FieldNo("Posting Date"),
          DATABASE::"Detailed Cust. Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedCustLedgEntry.FieldNo("Cust. Ledger Entry No."),
          DATABASE::"Detailed Cust. Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedCustLedgEntry.FieldNo(Amount),
          DATABASE::"Detailed Cust. Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedCustLedgEntry.FieldNo("Amount (LCY)"),
          DATABASE::"Detailed Cust. Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedCustLedgEntry.FieldNo("Transaction No."),
          DATABASE::"Detailed Cust. Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedCustLedgEntry.FieldNo("Entry No."),
          DATABASE::"Detailed Cust. Ledg. Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIVendorList()
    var
        Vendor: Record Vendor;
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Vendor List", PowerBIVendorListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIVendorListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Vendor.FieldNo("No."), DATABASE::Vendor);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Vendor.FieldNo(Name), DATABASE::Vendor);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Vendor.FieldNo("Balance Due"), DATABASE::Vendor);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo("Posting Date"),
          DATABASE::"Detailed Vendor Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo("Applied Vend. Ledger Entry No."),
          DATABASE::"Detailed Vendor Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo(Amount),
          DATABASE::"Detailed Vendor Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo("Amount (LCY)"),
          DATABASE::"Detailed Vendor Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo("Transaction No."),
          DATABASE::"Detailed Vendor Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo("Entry No."),
          DATABASE::"Detailed Vendor Ledg. Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, DetailedVendorLedgEntry.FieldNo("Remaining Pmt. Disc. Possible"),
          DATABASE::"Detailed Vendor Ledg. Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIJobList()
    var
        JobLedgerEntry: Record "Job Ledger Entry";
        TenantWebService: Record "Tenant Web Service";
        Job: Record Job;
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Jobs List", PowerBIJobsListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIJobsListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Job.FieldNo("No."), DATABASE::Job);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Job.FieldNo("Search Description"), DATABASE::Job);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Job.FieldNo(Complete), DATABASE::Job);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Job.FieldNo(Status), DATABASE::Job);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, JobLedgerEntry.FieldNo("Posting Date"), DATABASE::"Job Ledger Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, JobLedgerEntry.FieldNo("Total Cost"), DATABASE::"Job Ledger Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, JobLedgerEntry.FieldNo("Entry No."), DATABASE::"Job Ledger Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, JobLedgerEntry.FieldNo("Entry Type"), DATABASE::"Job Ledger Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBISalesList()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Sales List", PowerBISalesListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBISalesListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesHeader.FieldNo("No."), DATABASE::"Sales Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesHeader.FieldNo("Requested Delivery Date"),
          DATABASE::"Sales Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesHeader.FieldNo("Shipment Date"), DATABASE::"Sales Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesHeader.FieldNo("Due Date"), DATABASE::"Sales Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesLine.FieldNo(Quantity), DATABASE::"Sales Line");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesLine.FieldNo(Amount), DATABASE::"Sales Line");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesLine.FieldNo("No."), DATABASE::"Sales Line");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, SalesLine.FieldNo(Description), DATABASE::"Sales Line");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIPurchaseList()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Purchase List", PowerBIPurchaseListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIPurchaseListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseHeader.FieldNo("No."), DATABASE::"Purchase Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseHeader.FieldNo("Order Date"), DATABASE::"Purchase Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseHeader.FieldNo("Expected Receipt Date"),
          DATABASE::"Purchase Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseHeader.FieldNo("Due Date"), DATABASE::"Purchase Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseHeader.FieldNo("Pmt. Discount Date"),
          DATABASE::"Purchase Header");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseLine.FieldNo(Quantity), DATABASE::"Purchase Line");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseLine.FieldNo(Amount), DATABASE::"Purchase Line");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseLine.FieldNo("No."), DATABASE::"Purchase Line");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, PurchaseLine.FieldNo(Description), DATABASE::"Purchase Line");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIItemPurchaseList()
    var
        Item: Record Item;
        ItemLedgerEntry: Record "Item Ledger Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Item Purchase List", PowerBIItemPurchasesListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIItemPurchasesListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Item.FieldNo("No."), DATABASE::Item);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Item.FieldNo("Search Description"), DATABASE::Item);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, ItemLedgerEntry.FieldNo("Posting Date"),
          DATABASE::"Item Ledger Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, ItemLedgerEntry.FieldNo("Invoiced Quantity"),
          DATABASE::"Item Ledger Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, ItemLedgerEntry.FieldNo("Entry No."), DATABASE::"Item Ledger Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIItemSalesList()
    var
        Item: Record Item;
        ValueEntry: Record "Value Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Item Sales List", PowerBIItemSalesListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIItemSalesListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Item.FieldNo("No."), DATABASE::Item);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, Item.FieldNo("Search Description"), DATABASE::Item);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, ValueEntry.FieldNo("Posting Date"), DATABASE::"Value Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, ValueEntry.FieldNo("Invoiced Quantity"), DATABASE::"Value Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, ValueEntry.FieldNo("Entry No."), DATABASE::"Value Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIGLAmountList()
    var
        GLAccount: Record "G/L Account";
        GLEntry: Record "G/L Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI GL Amount List", PowerBIGLAmountListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIGLAmountListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo("No."), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo(Name), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo("Account Type"), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo("Debit/Credit"), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLEntry.FieldNo("Posting Date"), DATABASE::"G/L Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLEntry.FieldNo(Amount), DATABASE::"G/L Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLEntry.FieldNo("Entry No."), DATABASE::"G/L Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIGLBudgetedAmountList()
    var
        GLAccount: Record "G/L Account";
        GLBudgetEntry: Record "G/L Budget Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI GL Budgeted Amount", PowerBIGLBudgetedAmountListTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIGLBudgetedAmountListTxt);
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo("No."), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo(Name), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo("Account Type"), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLAccount.FieldNo("Debit/Credit"), DATABASE::"G/L Account");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLBudgetEntry.FieldNo(Date), DATABASE::"G/L Budget Entry");
        CreateTenantWebServiceColumn(TenantWebService.RecordId, GLBudgetEntry.FieldNo(Amount), DATABASE::"G/L Budget Entry");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBITopCustOverviewWebService()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        Customer: Record Customer;
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Top Cust. Overview", PowerBITopCustOverviewTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBITopCustOverviewTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Entry No."),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Posting Date"),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Customer No."),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Sales (LCY)"),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Customer.FieldNo(Name),
          DATABASE::Customer, metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBISalesHdrCustWebService()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Item: Record Item;
        Customer: Record Customer;
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Sales Hdr. Cust.", PowerBISalesHdrCustTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBISalesHdrCustTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, SalesHeader.FieldNo("No."), DATABASE::"Sales Header",
          metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, SalesLine.FieldNo("No."), DATABASE::"Sales Line",
          metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, SalesLine.FieldNo(Quantity),
          DATABASE::"Sales Line", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, SalesLine.FieldNo("Qty. Invoiced (Base)"),
          DATABASE::"Sales Line", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, SalesLine.FieldNo("Qty. Shipped (Base)"),
          DATABASE::"Sales Line", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo("Base Unit of Measure"),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo(Description),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo(Inventory),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo("Unit Price"),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Customer.FieldNo("No."),
          DATABASE::Customer, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Customer.FieldNo(Name),
          DATABASE::Customer, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Customer.FieldNo(Balance),
          DATABASE::Customer, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Customer.FieldNo("Country/Region Code"),
          DATABASE::Customer, metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBICustItemLedgEntWebService()
    var
        Customer: Record Customer;
        ItemLedgerEntry: Record "Item Ledger Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Cust. Item Ledg. Ent.", PowerBICustItemLedgEntTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBICustItemLedgEntTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Customer.FieldNo("No."),
          DATABASE::Customer, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, ItemLedgerEntry.FieldNo("Item No."),
          DATABASE::"Item Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, ItemLedgerEntry.FieldNo(Quantity),
          DATABASE::"Item Ledger Entry", metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBICustLedgerEntriesWebService()
    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Cust. Ledger Entries", PowerBICustLedgerEntriesTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBICustLedgerEntriesTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Entry No."),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Due Date"),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Remaining Amt. (LCY)"),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo(Open),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Customer Posting Group"),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Sales (LCY)"),
          DATABASE::"Cust. Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, CustLedgerEntry.FieldNo("Posting Date"),
          DATABASE::"Cust. Ledger Entry", metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIVendorLedgerEntriesWebService()
    var
        VendorLedgerEntry: Record "Vendor Ledger Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Vendor Ledger Entries", PowerBIVendorLedgerEntriesTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIVendorLedgerEntriesTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, VendorLedgerEntry.FieldNo("Entry No."),
          DATABASE::"Vendor Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, VendorLedgerEntry.FieldNo("Due Date"),
          DATABASE::"Vendor Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, VendorLedgerEntry.FieldNo("Remaining Amt. (LCY)"),
          DATABASE::"Vendor Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, VendorLedgerEntry.FieldNo(Open),
          DATABASE::"Vendor Ledger Entry", metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIPurchaseHdrVendorWebService()
    var
        PurchaseHeader: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        Item: Record Item;
        Vendor: Record Vendor;
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Purchase Hdr. Vendor", PowerBIPurchaseHdrVendorTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIPurchaseHdrVendorTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, PurchaseHeader.FieldNo("No."),
          DATABASE::"Purchase Header", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, PurchaseLine.FieldNo("No."),
          DATABASE::"Purchase Line", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, PurchaseLine.FieldNo(Quantity),
          DATABASE::"Purchase Line", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo("Base Unit of Measure"),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo(Description),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo(Inventory),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo("Qty. on Purch. Order"),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Item.FieldNo("Unit Price"),
          DATABASE::Item, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Vendor.FieldNo("No."),
          DATABASE::Vendor, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Vendor.FieldNo(Name),
          DATABASE::Vendor, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Vendor.FieldNo(Balance),
          DATABASE::Vendor, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Vendor.FieldNo("Country/Region Code"),
          DATABASE::Vendor, metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIVendItemLedgEntWebService()
    var
        Vendor: Record Vendor;
        ItemLedgerEntry: Record "Item Ledger Entry";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
        metaData: DotNet BCQueryMetadataReader;
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Query, QUERY::"Power BI Vend. Item Ledg. Ent.", PowerBIVendItemLedgEntTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Query, PowerBIVendItemLedgEntTxt);
        ODataUtility.GetTenantWebServiceMetadata(TenantWebService, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, Vendor.FieldNo("No."),
          DATABASE::Vendor, metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, ItemLedgerEntry.FieldNo("Item No."),
          DATABASE::"Item Ledger Entry", metaData);
        ODataUtility.CreateTenantWebServiceColumnForQuery(TenantWebService.RecordId, ItemLedgerEntry.FieldNo(Quantity),
          DATABASE::"Item Ledger Entry", metaData);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIAgedAccPayableWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Aged Acc. Payable", PowerBIAgedAccPayableTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIAgedAccPayableTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(ID),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Period Type"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Date),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Date Sorting"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Period Type Sorting"),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIAgedAccReceivableWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Aged Acc. Receivable", PowerBIAgedAccReceivableTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIAgedAccReceivableTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(ID),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Date),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Date Sorting"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Period Type"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Period Type Sorting"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure Name"),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIAgedInventoryChartWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Aged Inventory Chart", PowerBIAgedInventoryChartTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIAgedInventoryChartTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(ID),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Date),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Period Type"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Period Type Sorting"),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIJobActBudgPriceWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Job Act. v. Budg. Price", PowerBIJobActBudgPriceTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIJobActBudgPriceTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure No."),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure Name"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIJobProfitabilityWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Job Profitability", PowerBIJobProfitabilityTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIJobProfitabilityTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure No."),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure Name"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIJobActBudgCostWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Job Act. v. Budg. Cost", PowerBIJobActBudgCostTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIJobActBudgCostTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure No."),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure Name"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBISalesPipelineWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Sales Pipeline", PowerBISalesPipelineTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBISalesPipelineTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(ID),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Row No."),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure Name"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure No."),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBITop5OpportunitiesWebService()
    var
        PowerBIChartBuffer: Record "Power BI Chart Buffer";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Top 5 Opportunities", PowerBITop5OpportunitiesTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBITop5OpportunitiesTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(ID),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo(Value),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure Name"),
          DATABASE::"Power BI Chart Buffer");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIChartBuffer.FieldNo("Measure No."),
          DATABASE::"Power BI Chart Buffer");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIWorkDateCalcWebService()
    var
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI WorkDate Calc.", PowerBIWorkDateCalcTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIWorkDateCalcTxt);

        CreateTenantWebServiceOData(TenantWebService);
    end;

    local procedure CreatePowerBIReportLabelsWebService()
    var
        PowerBIReportLabels: Record "Power BI Report Labels";
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"PBI Report Labels", PowerBIReportLabelsTxt, true);

        TenantWebService.Get(TenantWebService."Object Type"::Page, PowerBIReportLabelsTxt);
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIReportLabels.FieldNo("Label ID"),
          DATABASE::"Power BI Report Labels");
        ODataUtility.CreateTenantWebServiceColumnForPage(TenantWebService.RecordId, PowerBIReportLabels.FieldNo("Text Value"),
          DATABASE::"Power BI Report Labels");

        CreateTenantWebServiceOData(TenantWebService);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateContactDuplicateSearchString()
    var
        ContDuplicateSearchString: Record "Cont. Duplicate Search String";
    begin
        ContDuplicateSearchString.DeleteAll;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeBankAccReconciliation()
    var
        BankAccReconciliation: Record "Bank Acc. Reconciliation";
    begin
        BankAccReconciliation.ModifyAll("Copy VAT Setup to Jnl. Line", true, true);
    end;

    local procedure UpdateItemCategoryCodeOnLinesRecords(var UPGItem: Record "UPG Item"; var ItemCategory: Record "Item Category")
    var
        SalesShipmentLine: Record "Sales Shipment Line";
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        PurchRcptLine: Record "Purch. Rcpt. Line";
        PurchInvLine: Record "Purch. Inv. Line";
        RequisitionLine: Record "Requisition Line";
        ItemLedgerEntry: Record "Item Ledger Entry";
        SalesLine: Record "Sales Line";
        PurchaseLine: Record "Purchase Line";
        SalesLineArchive: Record "Sales Line Archive";
        PurchaseLineArchive: Record "Purchase Line Archive";
        TransferLine: Record "Transfer Line";
        TransferShipmentLine: Record "Transfer Shipment Line";
        TransferReceiptLine: Record "Transfer Receipt Line";
        ServiceLine: Record "Service Line";
        ServiceShipmentLine: Record "Service Shipment Line";
        ServiceInvoiceLine: Record "Service Invoice Line";
        ServiceCrMemoLine: Record "Service Cr.Memo Line";
        ReturnShipmentLine: Record "Return Shipment Line";
        ReturnReceiptLine: Record "Return Receipt Line";
        StandardItemJournalLine: Record "Standard Item Journal Line";
        ItemJournalLine: Record "Item Journal Line";
    begin
        SalesShipmentLine.SetRange(Type, SalesShipmentLine.Type::Item);
        SalesShipmentLine.SetRange("No.", UPGItem."No.");
        SalesShipmentLine.ModifyAll("Item Category Code", ItemCategory.Code);

        SalesInvoiceLine.SetRange(Type, SalesInvoiceLine.Type::Item);
        SalesInvoiceLine.SetRange("No.", UPGItem."No.");
        SalesInvoiceLine.ModifyAll("Item Category Code", ItemCategory.Code);

        SalesCrMemoLine.SetRange(Type, SalesCrMemoLine.Type::Item);
        SalesCrMemoLine.SetRange("No.", UPGItem."No.");
        SalesCrMemoLine.ModifyAll("Item Category Code", ItemCategory.Code);

        PurchRcptLine.SetRange(Type, PurchRcptLine.Type::Item);
        PurchRcptLine.SetRange("No.", UPGItem."No.");
        PurchRcptLine.ModifyAll("Item Category Code", ItemCategory.Code);

        PurchInvLine.SetRange(Type, PurchInvLine.Type::Item);
        PurchInvLine.SetRange("No.", UPGItem."No.");
        PurchInvLine.ModifyAll("Item Category Code", ItemCategory.Code);

        RequisitionLine.SetRange(Type, RequisitionLine.Type::Item);
        RequisitionLine.SetRange("No.", UPGItem."No.");
        RequisitionLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ItemLedgerEntry.SetRange("Item No.", UPGItem."No.");
        ItemLedgerEntry.ModifyAll("Item Category Code", ItemCategory.Code);

        SalesLine.SetRange(Type, SalesLine.Type::Item);
        SalesLine.SetRange("No.", UPGItem."No.");
        SalesLine.ModifyAll("Item Category Code", ItemCategory.Code);

        PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
        PurchaseLine.SetRange("No.", UPGItem."No.");
        PurchaseLine.ModifyAll("Item Category Code", ItemCategory.Code);

        SalesLineArchive.SetRange(Type, SalesLineArchive.Type::Item);
        SalesLineArchive.SetRange("No.", UPGItem."No.");
        SalesLineArchive.ModifyAll("Item Category Code", ItemCategory.Code);

        PurchaseLineArchive.SetRange(Type, PurchaseLineArchive.Type::Item);
        PurchaseLineArchive.SetRange("No.", UPGItem."No.");
        PurchaseLineArchive.ModifyAll("Item Category Code", ItemCategory.Code);

        TransferLine.SetRange("Item No.", UPGItem."No.");
        TransferLine.ModifyAll("Item Category Code", ItemCategory.Code);

        TransferShipmentLine.SetRange("Item No.", UPGItem."No.");
        TransferShipmentLine.ModifyAll("Item Category Code", ItemCategory.Code);

        TransferReceiptLine.SetRange("Item No.", UPGItem."No.");
        TransferReceiptLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ServiceLine.SetRange(Type, ServiceLine.Type::Item);
        ServiceLine.SetRange("No.", UPGItem."No.");
        ServiceLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ServiceShipmentLine.SetRange(Type, ServiceShipmentLine.Type::Item);
        ServiceShipmentLine.SetRange("No.", UPGItem."No.");
        ServiceShipmentLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ServiceInvoiceLine.SetRange(Type, ServiceInvoiceLine.Type::Item);
        ServiceInvoiceLine.SetRange("No.", UPGItem."No.");
        ServiceInvoiceLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ServiceCrMemoLine.SetRange(Type, ServiceCrMemoLine.Type::Item);
        ServiceCrMemoLine.SetRange("No.", UPGItem."No.");
        ServiceCrMemoLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ReturnShipmentLine.SetRange(Type, ReturnShipmentLine.Type::Item);
        ReturnShipmentLine.SetRange("No.", UPGItem."No.");
        ReturnShipmentLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ReturnReceiptLine.SetRange(Type, ReturnReceiptLine.Type::Item);
        ReturnReceiptLine.SetRange("No.", UPGItem."No.");
        ReturnReceiptLine.ModifyAll("Item Category Code", ItemCategory.Code);

        StandardItemJournalLine.SetRange("Item No.", UPGItem."No.");
        StandardItemJournalLine.ModifyAll("Item Category Code", ItemCategory.Code);

        ItemJournalLine.SetRange("Item No.", UPGItem."No.");
        ItemJournalLine.ModifyAll("Item Category Code", ItemCategory.Code);
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure CreateWorkflowWebhookWebServices()
    var
        TenantWebService: Record "Tenant Web Service";
        WebServiceManagement: Codeunit "Web Service Management";
    begin
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Sales Document Entity", 'salesDocuments', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Sales Document Line Entity", 'salesDocumentLines', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Purchase Document Entity", 'purchaseDocuments', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Purchase Document Line Entity", 'purchaseDocumentLines', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Sales Document Entity", 'workflowSalesDocuments', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Sales Document Line Entity", 'workflowSalesDocumentLines', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Purchase Document Entity", 'workflowPurchaseDocuments', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Purchase Document Line Entity", 'workflowPurchaseDocumentLines', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Gen. Journal Batch Entity", 'workflowGenJournalBatches', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Gen. Journal Line Entity", 'workflowGenJournalLines', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Workflow - Customer Entity", 'workflowCustomers', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Workflow - Item Entity", 'workflowItems', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Workflow - Vendor Entity", 'workflowVendors', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Page, PAGE::"Workflow Webhook Subscriptions", 'workflowWebhookSubscriptions', true);
        WebServiceManagement.CreateTenantWebService(
          TenantWebService."Object Type"::Codeunit, CODEUNIT::"Workflow Webhook Subscription", 'WorkflowActionResponse', true);
    end;

    [UpgradePerDatabase]
    [Scope('Internal')]
    procedure CreateExcelTemplateWebServices()
    begin
        CreateExcelTemplateWebService(ExcelTemplateIncomeStatementTxt, PAGE::"Income Statement Entity");
        CreateExcelTemplateWebService(ExcelTemplateBalanceSheetTxt, PAGE::"Balance Sheet Entity");
        CreateExcelTemplateWebService(ExcelTemplateTrialBalanceTxt, PAGE::"Trial Balance Entity");
        CreateExcelTemplateWebService(ExcelTemplateRetainedEarningsStatementTxt, PAGE::"Retained Earnings Entity");
        CreateExcelTemplateWebService(ExcelTemplateCashFlowStatementTxt, PAGE::"Cash Flow Statement Entity");
        CreateExcelTemplateWebService(ExcelTemplateAgedAccountsReceivableTxt, PAGE::"Aged AR Entity");
        CreateExcelTemplateWebService(ExcelTemplateAgedAccountsPayableTxt, PAGE::"Aged AP Entity");
        CreateExcelTemplateWebService(ExcelTemplateCompanyInformationTxt, PAGE::ExcelTemplateCompanyInfo);
    end;

    local procedure CreateExcelTemplateWebService(ObjectName: Text; PageID: Integer)
    var
        TenantWebService: Record "Tenant Web Service";
    begin
        Clear(TenantWebService);
        WebServiceManagement.CreateTenantWebService(TenantWebService."Object Type"::Page, PageID, ObjectName, true);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeReportSelections()
    var
        ReportSelections: Record "Report Selections";
    begin
        with ReportSelections do begin
            if not Get(Usage::"Pro Forma S. Invoice", '1') then
                InsertReportSelections(Usage::"Pro Forma S. Invoice", '1', REPORT::"Standard Sales - Pro Forma Inv");
            if not Get(Usage::"S.Arch.Blanket", '1') then
                InsertReportSelections(Usage::"S.Arch.Blanket", '1', REPORT::"Archived Blanket Sales Order");
            if not Get(Usage::"P.Arch.Blanket", '1') then
                InsertReportSelections(Usage::"P.Arch.Blanket", '1', REPORT::"Archived Blanket Purch. Order");
        end;
    end;

    local procedure InsertReportSelections(ReportUsage: Integer; ReportSequence: Code[10]; ReportID: Integer)
    var
        ReportSelections: Record "Report Selections";
    begin
        with ReportSelections do begin
            Init;
            Usage := ReportUsage;
            Sequence := ReportSequence;
            "Report ID" := ReportID;
            Insert;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeSalesSetup()
    var
        SalesReceivablesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesReceivablesSetup.Get then begin
            SalesReceivablesSetup."Archive Orders" := SalesReceivablesSetup."Archive Quotes and Orders";
            if SalesReceivablesSetup."Archive Quotes and Orders" then
                SalesReceivablesSetup."Archive Quotes" := SalesReceivablesSetup."Archive Quotes"::Always;
            SalesReceivablesSetup.Modify;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradePurchSetup()
    var
        PurchPayablesSetup: Record "Purchases & Payables Setup";
    begin
        if PurchPayablesSetup.Get then begin
            PurchPayablesSetup."Archive Orders" := PurchPayablesSetup."Archive Quotes and Orders";
            if PurchPayablesSetup."Archive Quotes and Orders" then
                PurchPayablesSetup."Archive Quotes" := PurchPayablesSetup."Archive Quotes"::Always;
            PurchPayablesSetup.Modify;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeCRMConnectionString()
    var
        CRMConnectionSetup: Record "CRM Connection Setup";
    begin
        if CRMConnectionSetup.Get then
            CRMConnectionSetup.SetConnectionString(CRMConnectionSetup."Connection String");
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateVATRateChangeSetup()
    var
        VATRateChangeSetup: Record "VAT Rate Change Setup";
    begin
        if VATRateChangeSetup.Get then begin
            VATRateChangeSetup."Ignore Status on Service Docs." := true;
            VATRateChangeSetup.Modify;
        end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateIntrastatContactSetup()
    var
        UPGCompanyInformation: Record "UPG Company Information";
        IntrastatSetup: Record "Intrastat Setup";
    begin
        if UPGCompanyInformation.Get then
            if UPGCompanyInformation."Intrastat Contact No." <> '' then begin
                if not IntrastatSetup.Get then
                    IntrastatSetup.Insert;
                IntrastatSetup."Intrastat Contact Type" := UPGCompanyInformation."Intrastat Contact Type";
                IntrastatSetup."Intrastat Contact No." := UPGCompanyInformation."Intrastat Contact No.";
                IntrastatSetup.Modify;
            end;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateCheckFieldSetup()
    var
        IntrastatJnlLine: Record "Intrastat Jnl. Line";
        IntraJnlManagement: Codeunit IntraJnlManagement;
    begin
        IntraJnlManagement.CreateDefaultAdvancedIntrastatSetup;
        InsertCheckFieldSetup(IntrastatJnlLine.FieldNo("Tariff No."));
        InsertCheckFieldSetup(IntrastatJnlLine.FieldNo("Country/Region Code"));
        InsertCheckFieldSetup(IntrastatJnlLine.FieldNo("Transaction Type"));
        InsertCheckFieldSetup(IntrastatJnlLine.FieldNo("Total Weight"));
        InsertCheckFieldSetup(IntrastatJnlLine.FieldNo(Quantity));
    end;

    local procedure InsertCheckFieldSetup(FieldNumber: Integer)
    var
        IntrastatCheckFieldSetup: Record "Intrastat Checklist Setup";
    begin
        with IntrastatCheckFieldSetup do begin
            Init;
            Validate("Field No.", FieldNumber);
            if Insert then;
        end;
    end;

    local procedure UpdateBlockedFields()
    var
        Item: Record Item;
    begin
        if Item.FindSet(true, false) then
            repeat
                Item.Validate("Sales Blocked", false);
                Item.Validate("Purchasing Blocked", false);
                if Item.Modify then;
            until Item.Next = 0;
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpdateJobs()
    var
        Job: Record Job;
        UpgradeTagMgt: Codeunit "Upgrade Tag Mgt";
        UpgradeTags: Codeunit "Upgrade Tags";
        IntegrationManagement: Codeunit "Integration Management";
        RecordRef: RecordRef;
    begin
        if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetAddingIDToJobsUpgradeTag) then
            exit;
        if Job.FindSet(true, false) then
            repeat
                if IsNullGuid(Job.Id) then begin
                    RecordRef.GetTable(Job);
                    IntegrationManagement.InsertUpdateIntegrationRecord(RecordRef, CurrentDateTime);
                    RecordRef.SetTable(Job);
                    Job.Modify;
                    Job.UpdateReferencedIds;
                end;
            until Job.Next = 0;
        UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetAddingIDToJobsUpgradeTag);
    end;

    [UpgradePerCompany]
    [Scope('Internal')]
    procedure UpgradeVATReportSetup()
    var
        VATReportSetup: Record "VAT Report Setup";
        UpgradeTagMgt: Codeunit "Upgrade Tag Mgt";
        UpgradeTags: Codeunit "Upgrade Tags";
        DateFormulaText: Text;
    begin
        if UpgradeTagMgt.HasUpgradeTag(UpgradeTags.GetVATRepSetupPeriodRemCalcUpgradeTag) then
            exit;

        with VATReportSetup do begin
            if not Get then
                exit;
            if IsPeriodReminderCalculation or ("Period Reminder Time" = 0) then
                exit;

            DateFormulaText := StrSubstNo('<%1D>', "Period Reminder Time");
            Evaluate("Period Reminder Calculation", DateFormulaText);
            "Period Reminder Time" := 0;

            if Modify then;
        end;

        UpgradeTagMgt.SetUpgradeTag(UpgradeTags.GetVATRepSetupPeriodRemCalcUpgradeTag);
    end;
}

