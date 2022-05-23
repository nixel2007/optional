#Использовать fluent
#Использовать notify

// Значение, хранящееся в Опциональный.
Перем ХранимыйОбъект;

// Конструктор объекта.
//
// Параметры:
//   Объект - Произвольный - Значение, которое необходимо упаковать в Опциональный.
//   ДопустимоНеопределено - Булево - Флаг допустимости упаковывания значения "Неопределено".
//
Процедура ПриСозданииОбъекта(Объект, ДопустимоНеопределено = Ложь)
	ХранимыйОбъект = Объект;
	
	Если НЕ ДопустимоНеопределено Тогда
		ВызватьИсключениеЕслиПустой();
	КонецЕсли;
	
КонецПроцедуры

// Проверка незаполненности значения в Опциональный.
//
//  Возвращаемое значение:
//   Булево
//
Функция Пустой() Экспорт
	Возврат ХранимыйОбъект = Неопределено;
КонецФункции

// Проверка заполненности значения в Опциональный.
//
//  Возвращаемое значение:
//   Булево
//
Функция СодержитЗначение() Экспорт
	Возврат НЕ Пустой();
КонецФункции

// Выполнить действие над значением, если оно сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция обработки, применяемая к объекту.
//		Результат обработки должен быть помещен в переменную Результат.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
//  Возвращаемое значение:
//   Опциональный - Обработанное значение, упакованное в Опциональный.
//
Функция Обработать(ОписаниеОповещения) Экспорт
	Если Пустой() Тогда
		Возврат ЭтотОбъект;
	КонецЕсли;
	
	ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещения);
	
	РезультатОбработки = Неопределено;
	ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, РезультатОбработки);
	
	Возврат Новый Опциональный(РезультатОбработки, Истина);
КонецФункции

// Выполнить действие, возвращающее другой Опциональный, над значением, если оно сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция развертки, применяемая к объекту.
//		Результат развертки должен быть помещен в переменную Результат.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
//  Выбрасывает исключение:
//    - Если функция развертки вернула значение, отличное от Опциональный.
//
//  Возвращаемое значение:
//   Опциональный - Обработанное значение, упакованное в Опциональный.
//
Функция Развернуть(ОписаниеОповещения) Экспорт

	ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещения);

	Если Пустой() Тогда
		Возврат Новый Опциональный(Неопределено, Истина);
	КонецЕсли;

	РезультатОбработки = Неопределено;
	ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, РезультатОбработки);

	Если ТипЗнч(РезультатОбработки) <> Тип("Опциональный") Тогда
		ВызватьИсключение "Функция развертки не вернула Опциональный";
	КонецЕсли;
	
	Возврат РезультатОбработки;

КонецФункции

// Выполнить действие фильтрации над значением, если оно сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция фильтракции, применяемая к объекту.
//		Результат фильтрации должен быть помещен в переменную Результат.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
//  Возвращаемое значение:
//   Опциональный - Отфильтрованное значение, упакованное в Опциональный.
//		Пустой Опциональный, если функция фильтрации вернула Ложь, иначе этот же экземпляр Опциональный.
//
Функция Фильтровать(ОписаниеОповещения) Экспорт
	Если Пустой() Тогда
		Возврат ЭтотОбъект;
	КонецЕсли;
	
	ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещения);
	
	РезультатФильтрации = Ложь;
	ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, РезультатФильтрации);
	
	Если РезультатФильтрации Тогда
		Возврат ЭтотОбъект;
	Иначе
		Возврат Новый Опциональный(Неопределено, Истина);
	КонецЕсли;
КонецФункции

// Выполнить действие над значением, если оно сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция обработки, применяемая к объекту.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
Процедура ЕслиСодержитЗначение(ОписаниеОповещения) Экспорт
	Если Пустой() Тогда
		Возврат;
	КонецЕсли;
	
	ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещения);

	ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, ХранимыйОбъект);
	
КонецПроцедуры

// Выполнить действие над значением, если оно сущуествует, или выполнить другое действие, если значение не сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция обработки, применяемая,
//		если Опциональный содержит заполненное значение.
//   ОписаниеОповещенияИначе - ОписаниеОповещения - Функция обработки, применяемая, 
//		если Опциональный содержит пустое значение.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
Процедура ЕслиСодержитЗначениеИначе(ОписаниеОповещения, ОписаниеОповещенияИначе) Экспорт
	
	ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещения);
	ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещенияИначе);

	Если СодержитЗначение() Тогда
		ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, ХранимыйОбъект);
	Иначе
		ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещенияИначе);
	КонецЕсли;

КонецПроцедуры

// Выполнить действие по расчету нового Опциональный, если текущий экземпляр Опциональный содержит пустое значение.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция создания значения для нового Опциональный,
//		если текущий Опциональный содержит пустое значение.
//		Результат создания значения должен быть помещен в переменную Результат.
//
//  Возвращаемое значение:
//   Опциональный - Новое значение, упакованное в Опциональный, 
//		если текущий экземпляр Опциональный содержит пустое значение.
//		Текущий экземпляр Опциональный, если он содержал значение.
//
Функция Или_(ОписаниеОповещения) Экспорт
	Если СодержитЗначение() Тогда
		Возврат ЭтотОбъект;
	КонецЕсли;

	РезультатОбработки = Неопределено;
	ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, РезультатОбработки);

	Возврат Новый Опциональный(РезультатОбработки, Истина);

КонецФункции

// Возвращает ПроцессорКоллекций, содерщаший 0 или 1 элемент. Если экземпляр Опционанальный содержит значение,
//	то ПроцессорКоллекций будет содержать это распакованное значение.
//
//  Возвращаемое значение:
//   ПроцессорКоллекций - ПроцессорКоллекций, содержащий распакованное значение Опциональный, если оно было заполнено.
//		Пустой ПроцессорКоллекций, если экземпляр Опциональный не содержал значение. 
//
Функция ПроцессорКоллекций() Экспорт

	Если Пустой() Тогда
		Возврат ПроцессорыКоллекций.ИзНабора();
	КонецЕсли;

	Возврат ПроцессорыКоллекций.ИзНабора(ХранимыйОбъект);

КонецФункции

// Получить значение, содержащееся в экземпляре Опциональный.
//
//  Выбрасывает исключение:
//    - Если экземпляр Опциональный не содержит значение.
//
//  Возвращаемое значение:
//   Произвольный - Значение, содержавщееся в экземпляре Опциональный.
//
Функция Получить() Экспорт
	ВызватьИсключениеЕслиПустой();
	Возврат ХранимыйОбъект;
КонецФункции

// Получить значение, содержащееся в экземпляре Опциональный, или переданное значение, 
//	если экземпляр Опциональный пустой.
//
// Параметры:
//   ЗначениеИначе - Произвольный - Значение, которое должна вернуть функция, если текущий экземпляр Опциональный
//		не содержит значение.
//
//  Возвращаемое значение:
//   Произвольный - Значение, содержавщееся в экземпляре Опциональный, или переданное значение.
//
Функция Иначе_(ЗначениеИначе) Экспорт

	Если СодержитЗначение() Тогда
		Возврат ХранимыйОбъект;
	КонецЕсли;

	Возврат ЗначениеИначе;

КонецФункции

// Получить значение, содержащееся в экземпляре Опциональный, или вычислить новое значение, 
//	если экземпляр Опциональный пустой.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция получения значения, которое должна вернуть функция,
//		если текущий экземпляр Опциональный не содержит значение.
//
//  Возвращаемое значение:
//   Произвольный - Значение, содержавщееся в экземпляре Опциональный,
//		или результат переданной функции получения значения.
//
Функция ИначеПолучить(ОписаниеОповещения) Экспорт
	
	Если СодержитЗначение() Тогда
		Возврат ХранимыйОбъект;
	КонецЕсли;

	РезультатОбработки = Неопределено;
	ОписанияОповещений.ВыполнитьОбработкуОповещения(ОписаниеОповещения, РезультатОбработки);

	Возврат РезультатОбработки;

КонецФункции

// Получить значение, хранящееся в экземпляре Опциональный, или выбросить исключение с переданной информацией об ошибке.
//
// Параметры:
//   ИнформацияОбОшибке - ИнформацияОбОшибке - Данные исключения, которое необходимо выбросить, если Опциональный
//		содержит пустое значение.
//
//  Выбрасывает исключение:
//    - Если экземпляр Опциональный не содержит значение.
//
//  Возвращаемое значение:
//   Произвольный - Значение, содержавщееся в экземпляре Опциональный.
//
Функция ИначеВызватьИсключение(ИнформацияОбОшибке) Экспорт
	
	Если Пустой() Тогда
		ВызватьИсключение ИнформацияОбОшибке;
	КонецЕсли;
	
	Возврат ХранимыйОбъект;

КонецФункции

Процедура ВызватьИсключениеЕслиПустой()
	Если Пустой() Тогда
		ВызватьИсключение "Хранимое значение является Неопределено";
	КонецЕсли;
КонецПроцедуры

Процедура ПодготовитьОписаниеОповещенияКВыполнению(ОписаниеОповещения)
	Если ОписаниеОповещения.ДополнительныеПараметры = Неопределено Тогда
		ОписаниеОповещения.ДополнительныеПараметры = Новый Структура;
	КонецЕсли;
	ОписаниеОповещения.ДополнительныеПараметры.Вставить("Объект", ХранимыйОбъект);
КонецПроцедуры
