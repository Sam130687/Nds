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
  cAccuracy = 2;        // Точность расчета, указывает сколько знаков после запятой учитывать и отоброжать
var
  vMinDiff: double;     //Минимальная разница вычисления
  vWithNDS: double;     //Вычисляемая сумма с НДС
  vWithoutNDS: double;  //Вычисляеммая сумма без НДС
  i: Integer;
  vAccuracy: Integer;
begin
  vAccuracy := Trunc(Power(10, cAccuracy));
  vMinDiff := 100000;
  CorrectedPriceWithNDS := 0;
  CorrectedPriceWithoutNDS := 0;
  // Запустим цикл расчета с указанной точностью
  for i := 0 to Trunc((InputPriceWithNDS + 1) * vAccuracy) do  // Добавим 1 у.е для охвата верхней границы
    begin
      vWithNDS := i / vAccuracy; // Перебираем все возможные значения с 2 знаками
      vWithoutNDS := vWithNDS / (1 + ProcNDS / 100);  // Цена без НДС
      // Проверяем что вычисляемая разница минимальна, близка к 1/10 точности
      if Abs(Trunc(vWithoutNDS * vAccuracy) - vWithoutNDS * vAccuracy) < 0.1/vAccuracy then
        begin
          // Сравниваем разницу, в случае когда разница меньше нашей минимальной берем новое значение за результат.
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
