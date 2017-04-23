package com.nimbus.util;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.time.DateUtils;

public class DateUtil {
  // Time values in milliseconds
  public static final int WEEK_DAYS = 7;
  public static final long SECOND = 1000;
  public static final long MINUTE = 60 * SECOND;
  public static final long HOUR = 60 * MINUTE;
  public static final long DAY = 24 * HOUR;
  public static final long WEEK = WEEK_DAYS * DAY;

  /**
   * get the different in seconds between two (calendar)date
   */
  public static Long getSecondsBetween2Date(Calendar c1, Calendar c2) {
    assert (c1 != null);
    assert (c2 != null);
    return (Long)((c1.getTimeInMillis() - c2.getTimeInMillis()) / SECOND);
  }

  /**
   * get the different in minutes between two (calendar)date
   */
  public static int getMinutesBetween2Date(Calendar c1, Calendar c2) {
    assert (c1 != null);
    assert (c2 != null);
    return (int) ((c1.getTimeInMillis() - c2.getTimeInMillis()) / MINUTE);
  }

  public static Calendar getYearCalendar(int year) {
    Calendar result = DateUtil.now();
    result.clear();
    result.set(Calendar.YEAR, year);
    return result;
  }

  public static Calendar getYearCalendar() {
    Calendar c = DateUtil.now();
    return getYearCalendar(c.get(Calendar.YEAR));
  }

  public static Calendar getNextYearCalendar(int years) {
    Calendar c = DateUtil.now();
    return getYearCalendar(c.get(Calendar.YEAR) + years);
  }

  public static int interval(final Calendar date1, final Calendar date2) {
    if (isSameDay(date1, date2))
      return 0;
    Calendar bigCopy = (Calendar) date1.clone();
    Calendar smallCopy = (Calendar) date2.clone();
    setTimeToMidnight(bigCopy);
    setTimeToMidnight(smallCopy);
    long day = (bigCopy.getTimeInMillis() - smallCopy.getTimeInMillis()) / DAY;
    return (int) day;
  }

  public static int daysRented(final Calendar end, final Calendar start) {
    int days = interval(end, start);
    if (days == 0)
      return 1;
    return days;
  }

  private static void setTimeToMidnight(Calendar calendar) {
    Calendar clone = (Calendar) calendar.clone();
    calendar.clear();
    calendar.set(Calendar.YEAR, clone.get(Calendar.YEAR));
    calendar.set(Calendar.MONTH, clone.get(Calendar.MONTH));
    calendar.set(Calendar.DATE, clone.get(Calendar.DATE));
  }

  public static boolean isSameDay(Calendar cal1, Calendar cal2) {
    return DateUtils.isSameDay(cal1, cal2);
  }

  public static int comparehours(Calendar small) {
    return getMinutesBetween2Date(DateUtil.now(), small) / 60;
  }

  public static int compareTody(Calendar small) {
    return interval(DateUtil.now(), small);
  }

  public static int compareMonth(Calendar c1, Calendar c2) {
    return compareYear(c1, c2) * 12
        + (c1.get(Calendar.MONTH) - c2.get(Calendar.MONTH));
  }

  public static int compareYear(Calendar c1, Calendar c2) {
    return c1.get(Calendar.YEAR) - c2.get(Calendar.YEAR);
  }

  public static int getCurrentYear() {
    Calendar c1 = DateUtil.now();
    return c1.get(Calendar.YEAR);
  }

  public static int getCurrentMonth() {
    return DateUtil.now().get(Calendar.MONTH);
  }

  public static boolean isNowBetween(Calendar start, Calendar end) {
    Calendar now = now();
    return now.after(start) && now.before(end);
  }

  public static boolean isToday(Calendar date) {
    return DateUtil.interval(date, DateUtil.now()) == 0;
  }

  /**
   * 
   * <pre>
   * parseYYYYMMDD(&quot;20071011&quot;, null);
   * parseYYYYMMDD(&quot;2007911&quot;, defaultDate);
   * </pre>
   */
  public static Calendar parseYYYYMMDD(String parameterValue,
                                       Calendar defaultValue) {
    try {
      return parseYYYYMMDD(parameterValue);
    } catch (Exception e) {
      return defaultValue;
    }
  }

  public static Calendar parseYYYYMMDD(String parameterValue) {
    String format = "yyyyMMdd";
    return parse(parameterValue, format);
  }

  public static Calendar parse(String string, String... format) {
    Calendar result = Calendar.getInstance();
    try {
      result.setTime(DateUtils.parseDate(string, format));
      return result;
    } catch (ParseException e) {
      throw new IllegalArgumentException(e);
    }
  }

  public static Calendar parseYYYY_MM_DD(String parameterValue) {
    String format = "yyyy-MM-dd";
    return parse(parameterValue, format);
  }

  public static Calendar parseYYYY_M_DD(String parameterValue) {
    String format = "yyyy-MM-dd ";
    return parse(parameterValue, format);
  }

  private static Calendar formerDate;

  public static void setSystemCurrentDate(Calendar date) {
    if (formerDate == null)
      formerDate = DateUtil.now();
    try {
      String command = String.format("cmd.exe /c date %s", toYYYY_MM_DD(date));
      Process cc = Runtime.getRuntime().exec(command);
      cc.waitFor();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
  }

  public static void resetTime() {
    if (formerDate == null)
      return;
    setSystemCurrentDate(formerDate);
  }

  public static Calendar getOneYearBeforeNow() {
    Calendar result = now();
    result.add(Calendar.YEAR, -1);
    return result;
  }

  public static Calendar getOneWeekBeforeNow() {
    return addDate(-WEEK_DAYS);
  }

  public static Calendar getTwoWeekBeforeNow() {
    return addDate(-WEEK_DAYS * 2);
  }

  public static Calendar getThreeMonthBeforeNow() {
    return getTheDayZero(addDate(-30 * 3));
  }

  public static Calendar getMidNightFutureAfter(Calendar date, int days) {
    Calendar future = (Calendar) date.clone();
    future.add(Calendar.DATE, days);
    return future;
  }

  private static Calendar addDate(int days) {
    Calendar result = now();
    result.add(Calendar.DATE, days);
    return result;
  }

  public static Calendar getTheDayZero(Calendar date) {
    Calendar result = (Calendar) date.clone();
    result.set(Calendar.HOUR_OF_DAY, 0);
    result.set(Calendar.MINUTE, 0);
    result.set(Calendar.SECOND, 0);
    result.set(Calendar.MILLISECOND, 0);
    return result;
  }

  public static Calendar getTheDayZero() {
    return getTheDayZero(DateUtil.now());
  }

  public static Calendar getTheDayMidnight() {
    return getTheDayMidnight(DateUtil.now());
  }

  public static Calendar getTheDayMidnight(Calendar date) {
    Calendar result = (Calendar) date.clone();
    result.set(Calendar.HOUR_OF_DAY, 23);
    result.set(Calendar.MINUTE, 59);
    result.set(Calendar.SECOND, 59);
    result.set(Calendar.MILLISECOND, 999);
    return result;
  }

  public static String nowTimeStamp() {
    return toTimeStamp(now());
  }

  public static String toMMDD(Calendar date) {
    return new SimpleDateFormat("MMdd").format(date.getTime());
  }

  public static String toYYYYMMDD(Calendar date) {
    return new SimpleDateFormat("yyyyMMdd").format(date.getTime());
  }

  public static String toYYYY_MM_DD(Calendar date) {
    return new SimpleDateFormat("yyyy-MM-dd").format(date.getTime());
  }

  public static String toMM_DD_HH_mm_ss(Calendar date) {
    return new SimpleDateFormat("MM-dd HH:mm:ss").format(date.getTime());
  }

  public static String toTimeStamp(Calendar calendar) {
    return new SimpleDateFormat("yyyyMMddHHmmss").format(calendar.getTime());
  }

  public static String toTimeStamp1(Calendar calendar) {
    return new SimpleDateFormat("yyyyMMddHHmm").format(calendar.getTime());
  }

  public static String toTimeStampFm(Calendar calendar) {
    return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar
        .getTime());
  }

  public static String toyyyy_MM_dd_HH_mm(Calendar calendar) {
    return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(calendar.getTime());
  }

  public static String toYYMMdd(Calendar calendar) {
    return new SimpleDateFormat("yyMMdd").format(calendar.getTime());
  }

  public static String toDateStamp(Calendar calendar) {
    return new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
  }

  public static String toHHmm(Calendar date) {
    return new SimpleDateFormat("HH:mm").format(date.getTime());
  }

  public static String toHHmmss(Calendar date) {
    return new SimpleDateFormat("HH:mm:ss").format(date.getTime());
  }

  public static String toHHmmssSSS(Calendar date) {
    return new SimpleDateFormat("HH:mm:ss SSS").format(date.getTime());
  }

  private static String[] parsePatterns;

  static {
    parsePatterns = new String[] { "yyyy/MM/dd", "yyyy-MM-dd",
        "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm", "yyyy-MM-dd HH:mm:ss",
        "yyyy/MM/dd HH:mm" };
  }

  public static Calendar parseTimeStamp(String string) {
    Calendar result = Calendar.getInstance();
    try {
      result.setTime(DateUtils.parseDate(string, parsePatterns));
      return result;
    } catch (ParseException e) {
      throw new IllegalArgumentException(e);
    }
  }

  public static Calendar parseTimeStamp(HttpServletRequest request) {
    return parseTimeStamp(request.getParameter("timeStamp"));
  }

  public static Calendar add(Calendar date, int field, int i) {
    Calendar copy = ((Calendar) date.clone());
    copy.add(field, i);
    return copy;
  }

  public static Calendar setTodayTime(String time, int offset) {
    Calendar result = Calendar.getInstance();
    String[] info = time.split(":");
    int hour = Integer.valueOf(info[0]);
    int minute = Integer.valueOf(info[1]);

    hour -= offset;
    if (hour < 0) hour += 24;

    result.set(Calendar.HOUR_OF_DAY, hour);
    result.set(Calendar.MINUTE, minute);
    result.set(Calendar.SECOND, 0);

    return result;
  }

  public static Calendar now() {
    return Calendar.getInstance();
  }

  public static Calendar getMixDate() {
    Calendar date = now();
    date.clear();
    return date;
  }
}
