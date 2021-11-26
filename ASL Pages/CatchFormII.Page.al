page 80088 "Catch Form II"
{
    // Packg
    // Bran
    // `B."0B"

    PageType = Card;
    SourceTable = "Medical Record";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Line No"; "Line No")
                {
                }
            }
            group("White Hon/Wild Tiger/Headless")
            {
                field("Employee No"; "Employee No")
                {
                }
                field("Transaction Date"; "Transaction Date")
                {
                }
                field("Transaction Type"; "Transaction Type")
                {
                }
                field("Hospital Code"; "Hospital Code")
                {
                }
                field(Beneficiary; Beneficiary)
                {
                }
                field("ASL Ref No"; "ASL Ref No")
                {
                }
                field(Amount; Amount)
                {
                }
                field("Region Code"; "Region Code")
                {
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                }
            }
            group("Brwn Hon/Cut. Fish/Crab/Others")
            {
            }
            group("Flw Tiger/Shrimp In Bags")
            {
            }
            group("Net Fish")
            {
            }
            group("Hook Fish")
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(List)
            {
                Caption = 'List';
            }
        }
    }

    var
        Packg: array[150] of Code[10];
        Bran: array[150] of Code[10];
        Voy: Record Job;
        JobRec: Record Job;
        ItemRec: Record Item;
        JJTemp: Record "Job Journal Template";
        JJBatc: Record "Job Journal Batch";
        JJLine: Record "Job Journal Line";
        CachDim: Record "Course Types";
        UOM: Record "Unit of Measure";
        B: Record "Job Category";
        CTH: array[86, 3] of Integer;
        I: Integer;
        J: Integer;
        K: Integer;
        FldNo: array[3] of Integer;
        Qtys: Integer;
        "Business Units Code": Integer;
        "Sea Temperature": Decimal;
        "Fishing Ground": Text[30];
        FldCont: array[3] of Code[10];
        D: Code[10];
        ItVar: Code[10];
        "Voyage No.": Code[10];
        Vessel: Code[10];
        UOMCd: Code[10];
        ItemVar: Code[10];
        "Catch Date": Date;

    local procedure InitAll()
    begin
        for I := 1 to 150 do begin
            Packg[I] := Packg[1];
            Bran[I] := Bran[1];
        end;
    end;
}

