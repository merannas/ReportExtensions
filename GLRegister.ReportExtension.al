reportextension 50100 "SPS GL Register" extends "G/L Register"
{
    RDLCLayout = 'GLRegisterSaysHelloWorld.rdl';

    dataset
    {
        add("G/L Register")
        {
            column(Journal_Batch_Name; "Journal Batch Name")
            { }
            column(Source_Code; "Source Code")
            { }

        }
    }

    requestpage
    {
        layout
        {

            addfirst(Control3)
            {
                field(RunAnotherReport; RunAnotherReport)
                {
                    Caption = 'Run Trial Balance report after';
                    ApplicationArea = all;
                }

            }

        }
        trigger OnOpenPage()
        begin
            Message('Hello World!');
        end;
    }
    protected var
        RunAnotherReport: Boolean;


    trigger OnPostReport()
    begin
        if RunAnotherReport then
            report.Run(Report::"Trial Balance")
        else
            if Confirm(('No, wait! \Do you want to run another another report?')) then
                report.Run(Report::"Trial Balance")


    end;



}