report 60081 "Crew List z"
{
    // Comp."Ship-to City"
    DefaultLayout = RDLC;
    RDLCLayout = './CrewListz.rdlc';


    dataset
    {
        dataitem(Job; Job)
        {
            RequestFilterFields = "No.";
            column(Job_No_; "No.")
            {
            }
            dataitem("Job Ledger Entry"; "Job Ledger Entry")
            {
                DataItemLink = "Job No." = FIELD ("No.");
                DataItemTableView = SORTING ("Allocation %", "Resource Group") ORDER(Descending);
                column(Comp__Ship_to_Address______COPYSTR_Comp__Ship_to_Address_2__1_5_; Comp."Ship-to Address" + ' ' + CopyStr(Comp."Ship-to Address 2", 1, 5))
                {
                }
                column(Comp__Ship_to_Name_; Comp."Ship-to Name")
                {
                }
                column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                {
                }
                column(COMPANYNAME; CompanyName)
                {
                }
                column(CurrReport_PAGENO; CurrReport.PageNo)
                {
                }
                column(USERID; UserId)
                {
                }
                column(VessNam; VessNam)
                {
                }
                column(Voyage; Voyage)
                {
                }
                column(Skipper; Skipper)
                {
                }
                column(Arriving____FORMAT_ETA_; 'Arriving :' + Format(ETA))
                {
                }
                column(Sailing_____FORMAT_ETD_; 'Sailing : ' + Format(ETD))
                {
                }
                column(Job_Budget_Line__Job_No__; "Job No.")
                {
                }
                column(Desig; Desig)
                {
                }
                column(Nam; Nam)
                {
                }
                column(countz; countz)
                {
                }
                column(Job_Budget_LineCaption; Job_Budget_LineCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Crew_Sailing_ListCaption; Crew_Sailing_ListCaptionLbl)
                {
                }
                column(VoyageCaption; VoyageCaptionLbl)
                {
                }
                column(SkipperCaption; SkipperCaptionLbl)
                {
                }
                column(VessNamCaption; VessNamCaptionLbl)
                {
                }
                column(Crew_On_Board_For_VoyageCaption; Crew_On_Board_For_VoyageCaptionLbl)
                {
                }
                column(DesigCaption; DesigCaptionLbl)
                {
                }
                column(NamCaption; NamCaptionLbl)
                {
                }
                column(countzCaption; countzCaptionLbl)
                {
                }
                column(Job_Budget_Line__Job_No__Caption; FieldCaption("Job No."))
                {
                }
                column(SkipperCaption_Control1000000007; SkipperCaption_Control1000000007Lbl)
                {
                }
                column(Job_Budget_Line_Type; Type)
                {
                }
                column(Job_Budget_Line_No_; "No.")
                {
                }
                column(Job_Budget_Line_Variant_Code; "Variant Code")
                {
                }

                trigger OnPostDataItem()
                begin
                    //CurrReport.NEWPAGE;
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo("Job No.");
                end;
            }

            trigger OnAfterGetRecord()
            begin
                //Recorded
                CalcFields(Points);
                if JobSetup.Get then
                    if "Sea Days" > 0 then
                        "Incentive Points Determinant" := Points * (JobSetup."Standard Sea Days" / "Sea Days");

                //IncentiveLookUp.GET;
                //IncentiveLookUp.SETRANGE(IncentiveLookUp.TableId,JobSetup."Incentive Rate Code"+"Fishing Country Code");
                IncentiveLookUp.SetRange(IncentiveLookUp."Lower Amount", 0, "Incentive Points Determinant");
                IncentiveLookUp.SetRange(IncentiveLookUp."Upper Amount", "Incentive Points Determinant", 999999);
                if IncentiveLookUp.Find('-') then
                    Validate("Incentive Rate", IncentiveLookUp."Extract Amount");

                Validate("Incentive (Pt. Based)", "Incentive Rate" * Points);
                //"Incentive (Hook Fish)":= "Incentive (Hook Fish)"/2;  //Incentive does not
                Validate("Total Incentive", "Incentive (Pt. Based)" + "Incentive (Hook Fish)");
                Validate("Net Incentive", "Total Incentive" + "Add/Ded. Crew");


                //Actual
                CalcFields("Points Actual");
                if JobSetup.Get then
                    if "Sea Days" > 0 then
                        "Incentive Pts Determt Actual" := "Points Actual" * (JobSetup."Standard Sea Days" / "Sea Days");

                //IncentiveLookUp.GET;
                //IncentiveLookUp.SETRANGE(IncentiveLookUp.TableId,JobSetup."Incentive Rate Code"+"Fishing Country Code");
                IncentiveLookUp.SetRange(IncentiveLookUp."Lower Amount", 0, "Incentive Pts Determt Actual");
                IncentiveLookUp.SetRange(IncentiveLookUp."Upper Amount", "Incentive Pts Determt Actual", 999999);
                if IncentiveLookUp.Find('-') then
                    Validate("Incentive Rate Actual", IncentiveLookUp."Extract Amount");

                Validate("Incentive (Pt. Based) Actual", "Incentive Rate Actual" * "Points Actual");
                //MESSAGE('%1 %2 %3', "Incentive (Pt. Based) Actual","Incentive Rate Actual","Points Actual");
                Validate("Total Incentive Actual", "Incentive (Pt. Based) Actual" + "Incentive (Hook Fish)");
                Validate("Net Incentive Actual", "Total Incentive Actual" + "Add/Ded. Crew");
                Modify;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        "------------------": Integer;
        Res: Record Resource;
        ResG: Record "Resource Group";
        Country: Record "Country/Region";
        Jobs: Record Job;
        DimVal: Record "Dimension Value";
        Comp: Record "Company Information";
        Loc: Record Location;
        IncentiveLookUp: Record "Payroll-Lookup Lines.";
        JobSetup: Record "Jobs Setup";
        CrewList: Boolean;
        PrintHd: Boolean;
        countz: Integer;
        SeaDays: Integer;
        COMPTitle: Text[30];
        T001: Text[50];
        VessNam: Text[30];
        Voyage: Text[30];
        Skipper: Text[30];
        CountryText: Text[30];
        Designation: Text[30];
        ETD: Date;
        ETA: Date;
        Nam: Code[50];
        Desig: Code[20];
        nation: Code[20];
        Vessel: Code[20];
        Dato: Date;
        Cat1: Code[20];
        TotalFor: Label 'Total for ';
        T002: Label 'Over all Total';
        Job_Budget_LineCaptionLbl: Label 'Job Budget Line';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Crew_Sailing_ListCaptionLbl: Label 'Crew Sailing List';
        VoyageCaptionLbl: Label 'Label1000000053';
        SkipperCaptionLbl: Label 'Skipper in Command';
        VessNamCaptionLbl: Label 'Vessel';
        Crew_On_Board_For_VoyageCaptionLbl: Label 'Crew On Board For Voyage';
        DesigCaptionLbl: Label 'Designation';
        NamCaptionLbl: Label 'Name';
        countzCaptionLbl: Label 'S/N';
        SkipperCaption_Control1000000007Lbl: Label 'Skipper';

    [Scope('Internal')]
    procedure BIN()
    begin
        CurrReport.ShowOutput(CrewList);
    end;
}

