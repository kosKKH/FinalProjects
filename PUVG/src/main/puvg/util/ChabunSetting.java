package main.puvg.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ChabunSetting {
	public static final String DELIMITER_MEMBER_V = "V";
	public static final String DELIMITER_APPROVAL_A = "A";
	public static final String DELIMITER_APPROVALTemp_A = "T";
	public static final String DELIMITER_SCHEDULE = "VS";
	public static final String DELIMITER_BOARD = "B";
	public static final String DELIMITER_RPBOARD = "RPB";
	
	public static String numPad(String t, String c) {
		for (int i=c.length(); i < 4; i++) {
			c = "0" + c;
		}				
		String ymd = DateFormatUtil.ymdFormats(t);
		
		return ymd.concat(c);
	}
	
	public static String numPad(String c) {
		
		//	i가 4보다 작으면 반복해서 c 앞에 문자 0을 추가
		for(int i = c.length(); i < 4; i++) {
			c = "0" + c;
		}
		return c;
	}
	
	public static String datenum() {
		return new SimpleDateFormat("yyyyMMdd").format(new Date());	
	} 
	
	public static String number(String dataBaseConnection) {
		
		for(int i = dataBaseConnection.length(); i < 4; i++ ) {
			dataBaseConnection = "0" + dataBaseConnection;
		}
		
		return dataBaseConnection;
	}
	
	public static String getMemberChabun(String type, String Num) {
		
		return DELIMITER_MEMBER_V.concat(ChabunSetting.numPad(type, Num));
	}
	
	public static String getApprovalChabun(String type, String Num) {
		
		return DELIMITER_APPROVAL_A.concat(ChabunSetting.numPad(type, Num));
	}
	
	public static String getApprovalTempChabun(String type, String Num) {
		
		return DELIMITER_APPROVALTemp_A.concat(ChabunSetting.numPad(type, Num));
	}
	
	public static String numberKosmoProduct(String dataBaseConnection) {
		return DELIMITER_SCHEDULE.concat(ChabunSetting.datenum()).concat(ChabunSetting.number(dataBaseConnection));
	}
	
	public static String BoardChabun(String commNum) {
		return DELIMITER_BOARD.concat(ChabunSetting.numPad(commNum));
	}
	
	public static String RpBoardChabun(String commNum) {
		return DELIMITER_RPBOARD.concat(ChabunSetting.numPad(commNum));
	}
}