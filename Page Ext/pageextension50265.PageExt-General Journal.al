pageextension 50265 pageextension50265 extends "General Journal"
{
    // UNL-ASL3.60.01.009 (Santus) June 14, 2005
    // -> modified the OnValidate trigger of the external document no. field. to check for permission to insert blocked
    //   employees into journal lines when reason code is employee.
    // //
    // #1..7
    layout
    {


        //Unsupported feature: Code Insertion on ""External Document No."(Control 81)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*

        if ("Reason Code" = 'EMPLOYEE') and ("External Document No." <> '') then begin
          Employee.Get("External Document No.");
          if Employee.Blocked then begin
            UserSetup.SetRange(UserSetup."User ID",UserId);
            UserSetup.SetRange(UserSetup."Pick Blocked Empl in Journal",true);
            if UserSetup.Find('-') then begin
              if not Confirm('Employee is blocked, do you want to continue?',false) then
                Employee.TestField(Blocked,false);
            end else
                Employee.TestField(Blocked,false);
          end;
        end;
        */
        //end;
        addafter("Incoming Document Entry No.")
        {
            field("Depreciation Book Code"; "Depreciation Book Code")
            {
            }
        }
        addafter(Description)
        {
            field(Description1; Description1)
            {
            }
        }
        addafter(Quantity)
        {
            field("Line No."; "Line No.")
            {
            }
        }
        addafter("Direct Debit Mandate ID")
        {
            field("FA Posting Type"; "FA Posting Type")
            {
                Visible = false;
            }
            field("FA Posting Date"; "FA Posting Date")
            {
                Visible = false;
            }
            field("Loan ID"; "Loan ID")
            {
                Visible = false;
            }
            field("Maintenance Code"; "Maintenance Code")
            {
                Visible = false;
            }
            field("Job No."; "Job No.")
            {
            }
        }
    }


    //Unsupported feature: Property Modification (Id) on "OpenApprovalEntriesOnBatchOrAnyJnlLineExist(Variable 1022)".

    //var
    //>>>> ORIGINAL VALUE:
    //OpenApprovalEntriesOnBatchOrAnyJnlLineExist : 1022;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OpenApprovalEntriesOnBatchOrAnyJnlLineExist : 1122;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ShowWorkflowStatusOnBatch(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShowWorkflowStatusOnBatch : 1016;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowWorkflowStatusOnBatch : 1116;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ShowWorkflowStatusOnLine(Variable 1023)".

    //var
    //>>>> ORIGINAL VALUE:
    //ShowWorkflowStatusOnLine : 1023;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ShowWorkflowStatusOnLine : 1123;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "ImportPayrollTransactionsAvailable(Variable 1028)".

    //var
    //>>>> ORIGINAL VALUE:
    //ImportPayrollTransactionsAvailable : 1028;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //ImportPayrollTransactionsAvailable : 1128;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsSaasExcelAddinEnabled(Variable 1029)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsSaasExcelAddinEnabled : 1029;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsSaasExcelAddinEnabled : 1129;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CanRequestFlowApprovalForBatch(Variable 1030)".

    //var
    //>>>> ORIGINAL VALUE:
    //CanRequestFlowApprovalForBatch : 1030;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CanRequestFlowApprovalForBatch : 1130;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CanRequestFlowApprovalForBatchAndAllLines(Variable 1031)".

    //var
    //>>>> ORIGINAL VALUE:
    //CanRequestFlowApprovalForBatchAndAllLines : 1031;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CanRequestFlowApprovalForBatchAndAllLines : 1131;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CanRequestFlowApprovalForBatchAndCurrentLine(Variable 1032)".

    //var
    //>>>> ORIGINAL VALUE:
    //CanRequestFlowApprovalForBatchAndCurrentLine : 1032;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CanRequestFlowApprovalForBatchAndCurrentLine : 1132;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CanCancelFlowApprovalForBatch(Variable 1033)".

    //var
    //>>>> ORIGINAL VALUE:
    //CanCancelFlowApprovalForBatch : 1033;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CanCancelFlowApprovalForBatch : 1133;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CanCancelFlowApprovalForLine(Variable 1034)".

    //var
    //>>>> ORIGINAL VALUE:
    //CanCancelFlowApprovalForLine : 1034;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CanCancelFlowApprovalForLine : 1134;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "AmountVisible(Variable 1035)".

    //var
    //>>>> ORIGINAL VALUE:
    //AmountVisible : 1035;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AmountVisible : 1135;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "DebitCreditVisible(Variable 1036)".

    //var
    //>>>> ORIGINAL VALUE:
    //DebitCreditVisible : 1036;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DebitCreditVisible : 1136;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "IsSaaS(Variable 1037)".

    //var
    //>>>> ORIGINAL VALUE:
    //IsSaaS : 1037;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //IsSaaS : 1137;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "MissingExchangeRatesQst(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //MissingExchangeRatesQst : 1017;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //MissingExchangeRatesQst : 1117;
    //Variable type has not been exported.

    var
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        GenJnlLine: Record "Gen. Journal Line";
        GenJnlTemplate: Record "Gen. Journal Template";


        //Unsupported feature: Code Modification on "OnAfterGetRecord".

        //trigger OnAfterGetRecord()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
        ShowShortcutDimCode(ShortcutDimCode);
        HasIncomingDocument := "Incoming Document Entry No." <> 0;
        CurrPage.IncomingDocAttachFactBox.PAGE.SetCurrentRecordID(RecordId);
        SetUserInteractions;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..5
        ShowView;
        */
        //end;

    procedure "----"()
    begin
    end;

    procedure ShowView()
    begin
        /*IF "Reason Code"<>'' THEN
        BEGIN
          CurrForm."Reason Code".VISIBLE(TRUE);
          CurrForm."External Document No.".VISIBLE(TRUE);
        END
        ELSE
        BEGIN
          CurrForm."Reason Code".VISIBLE(FALSE);
          CurrForm."External Document No.".VISIBLE(FALSE);
        END;
        */

    end;
}

