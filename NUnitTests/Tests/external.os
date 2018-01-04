﻿Перем юТест;

////////////////////////////////////////////////////////////////////
// Программный интерфейс

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;

	ВсеТесты.Добавить("ТестДолжен_ПроверитьКомпиляциюРегЭкспаВСтроку");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьКомпиляциюРегЭкспаВРегЭксп");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьКомпиляциюСложногоРегЭкспаВСтроку");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьКомпиляциюКаналящегосяРегЭкспаВСтроку");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьАнглийскиеСинонимы");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьURL");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДиапазон");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЛюбойДиапазон");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПовтор");

	Возврат ВсеТесты;
	
КонецФункции

Процедура ТестДолжен_ПроверитьКомпиляциюРегЭкспаВСтроку() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение();
	
	Результат = ВербальноеВыражение.ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьКомпиляциюРегЭкспаВРегЭксп() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение();
	
	ВербальноеВыражение.ЧтоНибудьНоНе("№");
	Сообщить(ВербальноеВыражение.ВСтроку());
	Результат = ВербальноеВыражение.ВРегулярноеВыражение();
	
	юТест.ПроверитьРавенство(ТипЗнч(Результат), Тип("РегулярноеВыражение"));
	юТест.ПроверитьИстину(Результат.Совпадает("КакоеТоСлово"));
	юТест.ПроверитьЛожь(Результат.Совпадает("№"));
	

КонецПроцедуры

Процедура ТестДолжен_ПроверитьКомпиляциюСложногоРегЭкспаВСтроку() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение();
	
	ВербальноеВыражение.Слово();
	Результат = ВербальноеВыражение.ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "\w+");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьКомпиляциюКаналящегосяРегЭкспаВСтроку() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение();
	
	Результат = Новый ВербальноеВыражение()
	    .НачалоСтроки()
	    .ЧтоУгодноНоНе("123")
	    .ЧтоУгодно()
	    .Слово()
	    .МожетБыть("раз-два-три")
	    .Слово()
	    .КонецСтроки()
	    .ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "^([^123]*)(.*)\w+(раз-два-три)?\w+$");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьАнглийскиеСинонимы() Экспорт

	ВербальноеВыражение = Новый VerbalExpression();
	
	ВербальноеВыражение.Word();
	Результат = ВербальноеВыражение.ToString();
	
	юТест.ПроверитьРавенство(Результат, "\w+");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьURL() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение()
	    .Найти(
	        Новый ВербальноеВыражение()
	            .Найти("http")
	            .МожетБыть("s")
	            .Либо("ftp")
	            .ВСтроку(),
	        Ложь
	    )
	    .Затем("://")
	    .ЧтоНибудь();
	    
	Сообщить(ВербальноеВыражение.ВСтроку());
	    
	РегулярноеВыражение = ВербальноеВыражение.ВРегулярноеВыражение();
	
	юТест.ПроверитьИстину(РегулярноеВыражение.Совпадает("https://google.com"));
	юТест.ПроверитьИстину(РегулярноеВыражение.Совпадает("http://google.com"));
	юТест.ПроверитьИстину(РегулярноеВыражение.Совпадает("ftp://google.com"));
	юТест.ПроверитьЛожь(РегулярноеВыражение.Совпадает("http://"));
	юТест.ПроверитьЛожь(РегулярноеВыражение.Совпадает("фывфывфыв://asdasd"));

КонецПроцедуры

Процедура ТестДолжен_ПроверитьДиапазон() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение();
	ВербальноеВыражение.Диапазон("0", "9");
	
	Результат = ВербальноеВыражение.ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "[0-9]");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьЛюбойДиапазон() Экспорт

	ВербальноеВыражение = Новый ВербальноеВыражение();
	ВербальноеВыражение.ЛюбойИз("123абв");
	
	Результат = ВербальноеВыражение.ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "[123абв]");

КонецПроцедуры

Процедура ТестДолжен_ПроверитьПовтор() Экспорт

	Результат = Новый ВербальноеВыражение()
        .Найти("а")
	    .ПовторитьПредыдущее(1)	
	    .ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "(а){1}");

	Результат = Новый ВербальноеВыражение()
        .Найти("а")
	    .ПовторитьПредыдущееОтИДо(1, 2)	
	    .ВСтроку();
	
	юТест.ПроверитьРавенство(Результат, "(а){1,2}");
	
КонецПроцедуры
