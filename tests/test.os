#Использовать ".."
#Использовать asserts
#Использовать notify

&Тест
Процедура КогдаСоздаетсяОбъектИзНеопределено_ТогдаКонструкторБросаетИсключение() Экспорт
	
	// Дано
	Объект = Неопределено;
	
	ИсключениеБрошено = Ложь;
	СообщениеОбОшибке = "";
	
	// Когда
	Попытка
		Опциональный = Новый Опциональный(Объект);
	Исключение
		ИсключениеБрошено = Истина;
		СообщениеОбОшибке = ОписаниеОшибки();
	КонецПопытки;
	
	// Тогда
	Ожидаем.Что(ИсключениеБрошено, "Было брошено исключение")
	.ЭтоИстина();
	Ожидаем.Что(СообщениеОбОшибке, "Текст исключения корректен")
	.Содержит("Хранимое значение является Неопределено");
	
КонецПроцедуры

&Тест
Процедура КогдаСоздаетсяОбъектИзНеопределено_ИНеопределеноДопустимо_ТогдаКонструкторНеБросаетИсключение() Экспорт
	
	// Дано
	Объект = Неопределено;
	ДопустимоНеопределено = Истина;
	
	// Когда
	Опциональный = Новый Опциональный(Объект, ДопустимоНеопределено);
	
	// Тогда
	Ожидаем.Что(Опциональный).Не_().ЭтоНеопределено();
	
КонецПроцедуры

&Тест
Процедура КогдаСоздаетсяОбъектИзНеопределено_ТогдаОпциональныйПустой() Экспорт
	
	// Дано
	Объект = Неопределено;
	ДопустимоНеопределено = Истина;
	
	// Когда
	Опциональный = Новый Опциональный(Объект, ДопустимоНеопределено);
	
	// Тогда
	Ожидаем.Что(Опциональный.Пустой()).ЭтоИстина();
	Ожидаем.Что(Опциональный.СодержитЗначение()).ЭтоЛожь();
	
КонецПроцедуры

&Тест
Процедура КогдаСоздаетсяОбъект_ТогдаОпциональныйНеПустой() Экспорт
	
	// Дано
	Объект = "";
	ДопустимоНеопределено = Ложь;
	
	// Когда
	Опциональный = Новый Опциональный(Объект, ДопустимоНеопределено);
	
	// Тогда
	Ожидаем.Что(Опциональный.Пустой()).ЭтоЛожь();
	Ожидаем.Что(Опциональный.СодержитЗначение()).ЭтоИстина();
	
КонецПроцедуры

&Тест
Процедура КогдаХранитОбъект_ТогдаВозвращаетЕго() Экспорт
	
	// Дано
	Объект = "123";
	Опциональный = Новый Опциональный(Объект);
	
	// Когда
	ХранимыйОбъект = Опциональный.Получить();
	
	// Тогда
	Ожидаем.Что(ХранимыйОбъект).Равно(Объект);
	
КонецПроцедуры

&Тест
Процедура КогдаХранитНеопределено_ТогдаБросаетИсключениеПриПолучении() Экспорт
	
	// Дано
	Объект = Неопределено;
	ДопустимоНеопределено = Истина;
	Опциональный = Новый Опциональный(Объект, ДопустимоНеопределено);
	
	// Когда
	Ожидаем.Что(Опциональный).Метод("Получить").ВыбрасываетИсключение("Неопределено");
	
КонецПроцедуры

&Тест
Процедура КогдаСодержитЗначение_ТогдаВыполняетОбработчикОповещения() Экспорт
	
	// Дано
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ДопПараметр", 1);

	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикОповещения", ЭтотОбъект, ДопПараметры);
	Опциональный = Новый Опциональный(1);
	
	// Когда
	Опциональный.ЕслиСодержитЗначение(ОписаниеОповещения);
	
	// Тогда
	Ожидаем.Что(ДопПараметры.ДопПараметр).Равно(2);
	
КонецПроцедуры


&Тест
Процедура КогдаВызываетсяОбработать_ТогдаВозвращаетНовыйОпциональныйСоЗначениемОбработки() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикОповещения", ЭтотОбъект);
	Опциональный = Новый Опциональный(1);
	
	// Когда
	ВторойОпциональный = Опциональный.Обработать(ОписаниеОповещения);
	
	// Тогда
	Ожидаем.Что(ВторойОпциональный).НЕ_().Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Получить()).Равно(2);
	
КонецПроцедуры

&Тест
Процедура КогдаВызываетсяОбработатьНаПустомОпциональном_ТогдаВозвращаетСебя() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикОповещения", ЭтотОбъект);
	Опциональный = Новый Опциональный(Неопределено, Истина);
	
	// Когда
	ВторойОпциональный = Опциональный.Обработать(ОписаниеОповещения);
	
	// Тогда
	Ожидаем.Что(ВторойОпциональный).Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Пустой()).ЭтоИстина();
	
КонецПроцедуры

&Тест
Процедура КогдаФильтрацияУспешная_ТогдаВозвращаетЭтотОбъект() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикФильтрации", ЭтотОбъект);
	Опциональный = Новый Опциональный(1);
	
	// Когда
	ВторойОпциональный = Опциональный.Фильтровать(ОписаниеОповещения);
	
	// Тогда
	Ожидаем.Что(ВторойОпциональный).Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Получить()).Равно(1);
	
КонецПроцедуры

&Тест
Процедура КогдаФильтрацияНеУспешная_ТогдаВозвращаетПустойОпциональный() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикФильтрации", ЭтотОбъект);
	Опциональный = Новый Опциональный(2);
	
	// Когда
	ВторойОпциональный = Опциональный.Фильтровать(ОписаниеОповещения);
	
	// Тогда
	Ожидаем.Что(ВторойОпциональный).НЕ_().Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Пустой()).ЭтоИстина();
	
КонецПроцедуры


&Тест
Процедура КогдаСодержитЗначение_ИВызываетсяЕслиИначе_ТогдаОбрабатываетЗначение() Экспорт
	
	// Дано
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ДопПараметр", 1);

	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикОповещения", ЭтотОбъект, ДопПараметры);
	ОбработчикОповещенияИначе = ОписанияОповещений.Создать("ОбработчикОповещенияИначе", ЭтотОбъект, ДопПараметры);

	Опциональный = Новый Опциональный(1);
	
	// Когда
	Опциональный.ЕслиСодержитЗначениеИначе(ОписаниеОповещения, ОбработчикОповещенияИначе);
	
	// Тогда
	Ожидаем.Что(ДопПараметры.ДопПараметр).Равно(2);

КонецПроцедуры

&Тест
Процедура КогдаПустой_ИВызываетсяЕслиИначе_ТогдаОбрабатываетЗначение() Экспорт
	
	// Дано
	ДопПараметры = Новый Структура();
	ДопПараметры.Вставить("ДопПараметр", 1);

	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикОповещения", ЭтотОбъект, ДопПараметры);
	ОбработчикОповещенияИначе = ОписанияОповещений.Создать("ОбработчикОповещенияИначе", ЭтотОбъект, ДопПараметры);

	Опциональный = Новый Опциональный(Неопределено, Истина);
	
	// Когда
	Опциональный.ЕслиСодержитЗначениеИначе(ОписаниеОповещения, ОбработчикОповещенияИначе);
	
	// Тогда
	Ожидаем.Что(ДопПараметры.ДопПараметр).Равно(3);

КонецПроцедуры

&Тест
Процедура КогдаВызываетсяФункцияРазвертки_ТогдаВозвращаетсяНовыйОпциональный() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикРазвертки", ЭтотОбъект);
	Опциональный = Новый Опциональный(1);

	// Когда
	ВторойОпциональный = Опциональный.Развернуть(ОписаниеОповещения);

	// Тогда
	Ожидаем.Что(ВторойОпциональный).НЕ_().Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Получить()).Равно(2);

КонецПроцедуры

&Тест
Процедура КогдаПустой_ИВызываетсяФункцияРазвертки_ТогдаВозвращаетсяПустойОпциональный() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикРазвертки", ЭтотОбъект);
	Опциональный = Новый Опциональный(Неопределено, Истина);

	// Когда
	ВторойОпциональный = Опциональный.Развернуть(ОписаниеОповещения);

	// Тогда
	Ожидаем.Что(ВторойОпциональный).НЕ_().Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Пустой()).ЭтоИстина();
	
КонецПроцедуры

&Тест
Процедура КогдаСодержитЗначение_ИВызываетсяИли_ТогдаВозвращаетсяСебя() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикИли", ЭтотОбъект);
	Опциональный = Новый Опциональный(1);

	// Когда
	ВторойОпциональный = Опциональный.Или_(ОписаниеОповещения);

	// Тогда
	Ожидаем.Что(ВторойОпциональный).Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Получить()).Равно(1);
	
КонецПроцедуры

&Тест
Процедура КогдаПустой_ИВызываетсяИли_ТогдаВозвращаетсяРезультатОбработки() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикИли", ЭтотОбъект);
	Опциональный = Новый Опциональный(Неопределено, Истина);

	// Когда
	ВторойОпциональный = Опциональный.Или_(ОписаниеОповещения);

	// Тогда
	Ожидаем.Что(ВторойОпциональный).НЕ_().Равно(Опциональный);
	Ожидаем.Что(ВторойОпциональный.Получить()).Равно(2);
	
КонецПроцедуры

&Тест
Процедура КогдаСодержитЗначение_ТогдаВозвращаетЗаполненныйПроцессорКоллекций() Экспорт
	
	// Дано
	Опциональный = Новый Опциональный(1);

	// Когда
	ПроцессорКоллекций = Опциональный.ПроцессорКоллекций();

	// Тогда
	Ожидаем.Что(ПроцессорКоллекций).НЕ_().ЭтоНеопределено();
	Ожидаем.Что(ПроцессорКоллекций.Количество()).Равно(1);
	Ожидаем.Что(ПроцессорКоллекций.ПолучитьПервый()).Равно(1);
	
КонецПроцедуры

&Тест
Процедура КогдаПустой_ТогдаВозвращаетПустойПроцессорКоллекций() Экспорт
	
	// Дано
	Опциональный = Новый Опциональный(Неопределено, Истина);

	// Когда
	ПроцессорКоллекций = Опциональный.ПроцессорКоллекций();

	// Тогда
	Ожидаем.Что(ПроцессорКоллекций).НЕ_().ЭтоНеопределено();
	Ожидаем.Что(ПроцессорКоллекций.Количество()).Равно(0);
	
КонецПроцедуры


&Тест
Процедура КогдаСодержитЗначение_ТогдаМетодИначеВозвращаетСебя() Экспорт
	
	// Дано
	Объект = Новый Структура;
	Опциональный = Новый Опциональный(Объект);

	// Когда
	Значение = Опциональный.Иначе_(2);

	// Тогда
	Ожидаем.Что(Значение).Равно(Объект);
	
КонецПроцедуры

&Тест
Процедура КогдаПустой_ТогдаМетодИначеВозвращаетЗначениеИначе() Экспорт
	
	// Дано
	Объект = Неопределено;
	Опциональный = Новый Опциональный(Объект, Истина);

	// Когда
	ОбъектИначе = Новый Структура;
	Значение = Опциональный.Иначе_(ОбъектИначе);

	// Тогда
	Ожидаем.Что(Значение).НЕ_().Равно(Объект);
	Ожидаем.Что(Значение).Равно(ОбъектИначе);
	
КонецПроцедуры

&Тест
Процедура КогдаСодержитЗначение_ТогдаМетодИначеПолучитьВозвращаетСебя() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикИли", ЭтотОбъект);
	Объект = Новый Структура;
	Опциональный = Новый Опциональный(Объект);

	// Когда
	Значение = Опциональный.ИначеПолучить(ОписаниеОповещения);

	// Тогда
	Ожидаем.Что(Значение).Равно(Объект);
	
КонецПроцедуры

&Тест
Процедура КогдаПустой_ТогдаМетодИначеПолучитьВозвращаетРезультатОбработкиИначе() Экспорт
	
	// Дано
	ОписаниеОповещения = ОписанияОповещений.Создать("ОбработчикИли", ЭтотОбъект);
	Объект = Неопределено;
	Опциональный = Новый Опциональный(Объект, Истина);

	// Когда
	Значение = Опциональный.ИначеПолучить(ОписаниеОповещения);

	// Тогда
	Ожидаем.Что(Значение).Равно(2);
	
КонецПроцедуры

&Тест
Процедура КогдаСодержитЗначение_ТогдаМетодИначеВызватьИсключениеВозвращаетСебя() Экспорт
	
	// Дано
	Объект = Новый Структура;
	Опциональный = Новый Опциональный(Объект);

	// Когда
	Значение = Опциональный.ИначеВызватьИсключение(Новый ИнформацияОбОшибке("Текст", Неопределено));

	// Тогда
	Ожидаем.Что(Значение).Равно(Объект);
	
КонецПроцедуры

&Тест
Процедура КогдаПустой_ТогдаМетодИначеВызватьИсключениеВыбрасываетИсключение() Экспорт
	
	// Кокгда
	Объект = Неопределено;
	Опциональный = Новый Опциональный(Объект, Истина);
	
	ИнформацияОбОшибке = Новый ИнформацияОбОшибке("Мое исключение", Неопределено);
	ПараметрыМетода = Новый Массив;
	ПараметрыМетода.Добавить(ИнформацияОбОшибке);

	// Тогда
	Ожидаем.Что(Опциональный).Метод("ИначеВызватьИсключение", ПараметрыМетода).ВыбрасываетИсключение("Мое исключение");

КонецПроцедуры

Процедура ОбработчикОповещения(Результат, ДополнительныеПараметры) Экспорт // BSLLS:UnusedParameters-off
	Результат = ДополнительныеПараметры.Объект + 1;
	Если ДополнительныеПараметры.Свойство("ДопПараметр") Тогда
		ДополнительныеПараметры.ДопПараметр = Число(Результат);
	КонецЕсли;
КонецПроцедуры

Процедура ОбработчикОповещенияИначе(Результат, ДополнительныеПараметры) Экспорт // BSLLS:UnusedParameters-off
	Если ДополнительныеПараметры.Свойство("ДопПараметр") Тогда
		ДополнительныеПараметры.ДопПараметр = 3;
	КонецЕсли;
КонецПроцедуры

Процедура ОбработчикФильтрации(Результат, ДополнительныеПараметры) Экспорт
	Результат = ДополнительныеПараметры.Объект = 1;
КонецПроцедуры

Процедура ОбработчикРазвертки(Результат, ДополнительныеПараметры) Экспорт
	Результат = Новый Опциональный(ДополнительныеПараметры.Объект + 1);
КонецПроцедуры


Процедура ОбработчикИли(Результат, ДополнительныеПараметры) Экспорт // BSLLS:UnusedParameters-off
	Результат = 2;
КонецПроцедуры

