unit NDS;

interface

uses
  System.Math;

type
  TProcNDS = 0..99;

procedure CalcPrices(InputPriceWithNDS: double; ProcNDS: TProcNDS; out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: double);

implementation

procedure CalcPrices(InputPriceWithNDS: double; ProcNDS: TProcNDS; out CorrectedPriceWithNDS, CorrectedPriceWithoutNDS: double);
const
  cAccuracy = 2;        // �������� �������, ��������� ������� ������ ����� ������� ��������� � ����������
var
  vMinDiff: double;     //����������� ������� ����������
  vWithNDS: double;     //����������� ����� � ���
  vWithoutNDS: double;  //������������ ����� ��� ���
  i: Integer;
  vAccuracy: Integer;
begin
  vAccuracy := Trunc(Power(10, cAccuracy));
  vMinDiff := 100000;
  CorrectedPriceWithNDS := 0;
  CorrectedPriceWithoutNDS := 0;
  // �������� ���� ������� � ��������� ���������
  for i := 0 to Trunc((InputPriceWithNDS + 1) * vAccuracy) do  // ������� 1 �.� ��� ������ ������� �������
    begin
      vWithNDS := i / vAccuracy; // ���������� ��� ��������� �������� � 2 �������
      vWithoutNDS := vWithNDS / (1 + ProcNDS / 100);  // ���� ��� ���
      // ��������� ��� ����������� ������� ����������, ������ � 1/10 ��������
      if Abs(Trunc(vWithoutNDS * vAccuracy) - vWithoutNDS * vAccuracy) < 0.1/vAccuracy then
        begin
          // ���������� �������, � ������ ����� ������� ������ ����� ����������� ����� ����� �������� �� ���������.
          if Abs(vWithNDS - InputPriceWithNDS) < vMinDiff then
            begin
              vMinDiff := Abs(vWithNDS - InputPriceWithNDS);
              CorrectedPriceWithNDS := vWithNDS;
              CorrectedPriceWithoutNDS := Trunc(vWithoutNDS * vAccuracy) / vAccuracy;
            end;
        end;
    end;
end;

end.
