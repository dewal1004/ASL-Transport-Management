report 90042 "Daily Break Upz"
{
    // Invt[1]
    DefaultLayout = RDLC;
    RDLCLayout = './DailyBreakUpz.rdlc';


    dataset
    {
        dataitem(Item; Item)
        {
            DataItemTableView = SORTING ("Inventory Posting Group", "Statistics Group") WHERE ("Gen. Prod. Posting Group" = CONST ('FIS'));
            RequestFilterFields = "Inventory Posting Group", "Statistics Group", Inventory;
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo)
            {
            }
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(SeaRange_5_; SeaRange[5])
            {
            }
            column(SeaRange_4_; SeaRange[4])
            {
            }
            column(SeaRange_3_; SeaRange[3])
            {
            }
            column(SeaRange_2_; SeaRange[2])
            {
            }
            column(SeaRange_1_; SeaRange[1])
            {
            }
            column(SeaRange_6_; SeaRange[6])
            {
            }
            column(SeaRange_7_; SeaRange[7])
            {
            }
            column(SeaRange_8_; SeaRange[8])
            {
            }
            column(SeaRange_9_; SeaRange[9])
            {
            }
            column(SeaRange_10_; SeaRange[10])
            {
            }
            column(SeaRange_11_; SeaRange[11])
            {
            }
            column(SeaRange_12_; SeaRange[12])
            {
            }
            column(SeaRange_17_; SeaRange[17])
            {
            }
            column(SeaRange_16_; SeaRange[16])
            {
            }
            column(SeaRange_15_; SeaRange[15])
            {
            }
            column(SeaRange_14_; SeaRange[14])
            {
            }
            column(SeaRange_18_; SeaRange[18])
            {
            }
            column(SeaRange_19_; SeaRange[19])
            {
            }
            column(SeaRange_20_; SeaRange[20])
            {
            }
            column(SeaRange_21_; SeaRange[21])
            {
            }
            column(SeaRange_22_; SeaRange[22])
            {
            }
            column(SeaRange_23_; SeaRange[23])
            {
            }
            column(SeaRange_24_; SeaRange[24])
            {
            }
            column(SeaRange_13_; SeaRange[13])
            {
            }
            column(Item__Inventory_Posting_Group_; "Inventory Posting Group")
            {
            }
            column(Item__Statistics_Group_; "Statistics Group")
            {
            }
            column(Item__No__; "No.")
            {
            }
            column(Item_Description; Description)
            {
            }
            column(Item_Inventory; Inventory)
            {
            }
            column(SeaRangeC_1_; SeaRangeC[1])
            {
            }
            column(SeaRangeC_2_; SeaRangeC[2])
            {
            }
            column(SeaRangeC_3_; SeaRangeC[3])
            {
            }
            column(SeaRangeC_4_; SeaRangeC[4])
            {
            }
            column(SeaRangeC_5_; SeaRangeC[5])
            {
            }
            column(SeaRangeC_6_; SeaRangeC[6])
            {
            }
            column(SeaRangeC_7_; SeaRangeC[7])
            {
            }
            column(SeaRangeC_8_; SeaRangeC[8])
            {
            }
            column(SeaRangeC_9_; SeaRangeC[9])
            {
            }
            column(SeaRangeC_10_; SeaRangeC[10])
            {
            }
            column(SeaRangeC_11_; SeaRangeC[11])
            {
            }
            column(SeaRangeC_12_; SeaRangeC[12])
            {
            }
            column(SeaRangeC_13_; SeaRangeC[13])
            {
            }
            column(SeaRangeC_14_; SeaRangeC[14])
            {
            }
            column(SeaRangeC_15_; SeaRangeC[15])
            {
            }
            column(SeaRangeC_16_; SeaRangeC[16])
            {
            }
            column(SeaRangeC_17_; SeaRangeC[17])
            {
            }
            column(SeaRangeC_18_; SeaRangeC[18])
            {
            }
            column(SeaRangeC_19_; SeaRangeC[19])
            {
            }
            column(SeaRangeC_20_; SeaRangeC[20])
            {
            }
            column(SeaRangeC_21_; SeaRangeC[21])
            {
            }
            column(SeaRangeC_22_; SeaRangeC[22])
            {
            }
            column(SeaRangeC_23_; SeaRangeC[23])
            {
            }
            column(SeaRangeC_24_; SeaRangeC[24])
            {
            }
            column(TotalFor___FIELDCAPTION__Statistics_Group__; TotalFor + FieldCaption("Statistics Group"))
            {
            }
            column(Item_Inventory_Control23; Inventory)
            {
            }
            column(TotalFor___FIELDCAPTION__Inventory_Posting_Group__; TotalFor + FieldCaption("Inventory Posting Group"))
            {
            }
            column(Item_Inventory_Control25; Inventory)
            {
            }
            column(ItemCaption; ItemCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Item__No__Caption; FieldCaption("No."))
            {
            }
            column(Item_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Item_InventoryCaption; FieldCaption(Inventory))
            {
            }
            column(Item__Inventory_Posting_Group_Caption; FieldCaption("Inventory Posting Group"))
            {
            }
            column(Item__Statistics_Group_Caption; FieldCaption("Statistics Group"))
            {
            }

            trigger OnAfterGetRecord()
            begin
                level := TotLoc;
                repeat
                    Item.SetFilter(Item."Location Filter", SeaRange[level]);
                    Item.CalcFields(Item.Inventory);
                    SeaRangeC[level] := Item.Inventory;
                    level := level - 1;
                until level = 0
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Statistics Group");
                locate.SetRange(locate."Location Type", 1);
                TotLoc := locate.Count;
                Countx := 1;
                repeat
                    SeaRange[Countx] := locate.Code;
                    Countx := Countx + 1;
                until locate.Next = 0;
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
        TotalFor: Label 'Total for ';
        locate: Record Location;
        SeaRange: array[100] of Text[30];
        SeaRangeC: array[100] of Decimal;
        Countx: Integer;
        TotLoc: Integer;
        level: Integer;
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}

