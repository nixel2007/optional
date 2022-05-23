# Optional

## Опциональный

### ПриСозданииОбъекта

```bsl
// Конструктор объекта.
//
// Параметры:
//   Объект - Произвольный - Значение, которое необходимо упаковать в Опциональный.
//   ДопустимоНеопределено - Булево - Флаг допустимости упаковывания значения "Неопределено".
//
Процедура ПриСозданииОбъекта(Объект, ДопустимоНеопределено = Ложь) 
```

### Пустой

```bsl
// Проверка незаполненности значения в Опциональный.
//
//  Возвращаемое значение:
//   Булево
//
Функция Пустой() 
```

### СодержитЗначение

```bsl
// Проверка заполненности значения в Опциональный.
//
//  Возвращаемое значение:
//   Булево
//
Функция СодержитЗначение() 
```

### Обработать

```bsl
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
Функция Обработать(ОписаниеОповещения) 
```

### Развернуть

```bsl
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
Функция Развернуть(ОписаниеОповещения) 
```

### Фильтровать

```bsl
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
Функция Фильтровать(ОписаниеОповещения) 
```

### ЕслиСодержитЗначение

```bsl
// Выполнить действие над значением, если оно сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция обработки, применяемая к объекту.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
Процедура ЕслиСодержитЗначение(ОписаниеОповещения) 
```

### ЕслиСодержитЗначениеИначе

```bsl
// Выполнить действие над значением, если оно сущуествует, или выполнить другое действие, если значение не сущуествует.
//
// Параметры:
//   ОписаниеОповещения - ОписаниеОповещения - Функция обработки, применяемая,
//		если Опциональный содержит заполненное значение.
//   ОписаниеОповещенияИначе - ОписаниеОповещения - Функция обработки, применяемая, 
//		если Опциональный содержит пустое значение.
//		Объект обработки доступен в коллекции ДополнительныеПараметры.Объект.
//
Процедура ЕслиСодержитЗначениеИначе(ОписаниеОповещения, ОписаниеОповещенияИначе) 
```

### Или_

```bsl
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
Функция Или_(ОписаниеОповещения) 
```

### ПроцессорКоллекций

```bsl
// Возвращает ПроцессорКоллекций, содерщаший 0 или 1 элемент. Если экземпляр Опционанальный содержит значение,
//	то ПроцессорКоллекций будет содержать это распакованное значение.
//
//  Возвращаемое значение:
//   ПроцессорКоллекций - ПроцессорКоллекций, содержащий распакованное значение Опциональный, если оно было заполнено.
//		Пустой ПроцессорКоллекций, если экземпляр Опциональный не содержал значение. 
//
Функция ПроцессорКоллекций() 
```

### Получить

```bsl
// Получить значение, содержащееся в экземпляре Опциональный.
//
//  Выбрасывает исключение:
//    - Если экземпляр Опциональный не содержит значение.
//
//  Возвращаемое значение:
//   Произвольный - Значение, содержавщееся в экземпляре Опциональный.
//
Функция Получить() 
```

### Иначе_

```bsl
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
Функция Иначе_(ЗначениеИначе) 
```

### ИначеПолучить

```bsl
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
Функция ИначеПолучить(ОписаниеОповещения) 
```

### ИначеВызватьИсключение

```bsl
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
Функция ИначеВызватьИсключение(ИнформацияОбОшибке) 
```
