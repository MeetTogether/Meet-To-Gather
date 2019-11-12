package example;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

public class ExampleAllInOne {
	public static AllInOne all;
	public static void main(String[] args) {
		initial();
//		System.out.println("compare CheckMacValue method testing result: " + cmprChkMacValue());
//		System.out.println("apple pay create order: " + postCreateServerOrder());
//		System.out.println("doAction: " + postDoAction());
//		System.out.println("queryTradeInfo: " + postQueryTradeInfo());
//		System.out.println("queryCreditCardPeriodInfo: " + postQueryCreditCardPeriodInfo());
//		System.out.println("capture: " + postCapture());
//		System.out.println("queryTrade: " + postQueryTrade());
//		System.out.println("tradeNoAio: " + postTradeNoAio());
//		System.out.println("fundingReconDetail: " + postFundingReconDetail());
//		System.out.println("aioCheckOutALL: " + genAioCheckOutALL());
//		System.out.println("aioCheckOutATM: " + genAioCheckOutATM());
//		System.out.println("aioCheckOutCVS: " + genAioCheckOutCVS());
//		System.out.println("aioCheckOutBARCODE: " + genAioCheckOutBARCODE());
//		System.out.println("aioCheckOutDevide: " + genAioCheckOutDevide());
		System.out.println("aioCheckOutOneTime: " + genAioCheckOutOneTime());
//		System.out.println("aioCheckOutPeriod: " + genAioCheckOutPeriod());
//		System.out.println("aioCheckOutWebATM: " + genAioCheckOutWebATM());
	}
	private static void initial(){
		all = new AllInOne("");
	}
	
	
	public static String genAioCheckOutOneTime(){
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo("testCompany0011");
		obj.setMerchantTradeDate("2017/01/01 08:05:23");
		obj.setTotalAmount("50");
		obj.setTradeDesc("test Description");
		obj.setItemName("TestItem");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	
}
