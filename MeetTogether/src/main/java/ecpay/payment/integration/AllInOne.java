package ecpay.payment.integration;

import java.util.Arrays;
import java.util.Hashtable;
import java.util.Set;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import ecpay.payment.integration.domain.InvoiceObj;
import ecpay.payment.integration.ecpayOperator.EcpayFunction;
import ecpay.payment.integration.errorMsg.ErrorMessage;
import ecpay.payment.integration.exception.EcpayException;
import ecpay.payment.integration.verification.VerifyAioCheckOut;

/**
 * 全功能無履約保證類別
 * @author mark.chiu
 *
 */
public class AllInOne extends AllInOneBase{
	
	private final static Logger log = Logger.getLogger(AllInOne.class.getName());
	
	/**
	 * AllInOne Constructor
	 * 參數帶入log4j.properties的路徑，若帶入空字串則預設不產生log
	 * @param log4jPropertiesPath
	 */
	public AllInOne(String log4jPropertiesPath){
		super();
		if(log4jPropertiesPath != "" && log4jPropertiesPath != null){
			if(log4jPropertiesPath.substring(log4jPropertiesPath.length()-1) == "/")
				PropertyConfigurator.configure(log4jPropertiesPath + "log4j.properties");
			else
				PropertyConfigurator.configure(log4jPropertiesPath + "/log4j.properties");
		} else{
			Logger.getRootLogger().setLevel(Level.OFF);
		}
	}
	
	/**
	 * 檢查Hashtable中的檢查碼是否正確(確保資料未被竄改)
	 * @param Hashtable params
	 * @return boolean 
	 */
	public boolean compareCheckMacValue(Hashtable<String, String> params){
		String checkMacValue = "";
		if(!params.containsKey("CheckMacValue")){
			throw new EcpayException(ErrorMessage.HASHTABLE_WITHOUT_CHKMACVALUE);
		}
		try {
			checkMacValue = EcpayFunction.genCheckMacValue(HashKey, HashIV, params);
		} catch (EcpayException e) {
			throw new EcpayException(ErrorMessage.GEN_CHECK_MAC_VALUE_FAIL);
		}
		if(checkMacValue.equals(params.get("CheckMacValue"))){
			return true;
		} else{
			return false;
		}
	}
	
	
	/**
	 * 產生訂單Html form的方法
	 * @param aioCheckOutObj
	 * @param invoice
	 * @param String
	 */
	public String aioCheckOut(Object obj, InvoiceObj invoice){
		StringBuilder out = new StringBuilder();
		String ignoreParam = "";
		if(obj instanceof AioCheckOutALL){
			((AioCheckOutALL) obj).setPlatformID(PlatformID);
			if(!PlatformID.isEmpty() && ((AioCheckOutALL) obj).getMerchantID().isEmpty()){
				((AioCheckOutALL) obj).setMerchantID(MerchantID);
			} else if(!PlatformID.isEmpty() && !((AioCheckOutALL) obj).getMerchantID().isEmpty()){
			} else {
				((AioCheckOutALL) obj).setMerchantID(MerchantID);
			}
			((AioCheckOutALL) obj).setInvoiceMark(invoice == null? "N" : "Y");
			if(ignorePayment.length > 0){ 
				ignoreParam = Arrays.toString(ignorePayment);
				ignoreParam = ignoreParam.replaceAll(", ", "#");
				ignoreParam = ignoreParam.substring(1, ignoreParam.length()-1);
				((AioCheckOutALL) obj).setIgnorePayment(ignoreParam);
			}
			log.info("aioCheckOutALL params: " + ((AioCheckOutALL) obj).toString());
		} else if(obj instanceof AioCheckOutOneTime){
			((AioCheckOutOneTime) obj).setPlatformID(PlatformID);
			if(!PlatformID.isEmpty() && ((AioCheckOutOneTime) obj).getMerchantID().isEmpty()){
				((AioCheckOutOneTime) obj).setMerchantID(MerchantID);
			} else if(!PlatformID.isEmpty() && !((AioCheckOutOneTime) obj).getMerchantID().isEmpty()){
			} else {
				((AioCheckOutOneTime) obj).setMerchantID(MerchantID);
			}
			((AioCheckOutOneTime) obj).setInvoiceMark(invoice == null? "N" : "Y");
			log.info("aioCheckOutOneTime params: " + ((AioCheckOutOneTime) obj).toString());
		} else{
			throw new EcpayException(ErrorMessage.UNDIFINED_OBJECT);
		}
		try {
			VerifyAioCheckOut verify = new VerifyAioCheckOut();
			aioCheckOutUrl = verify.getAPIUrl(operatingMode);
			verify.verifyParams(obj);
			if(invoice != null){
				log.info("aioCheckOut invoice params: " + invoice.toString());
				verify.verifyParams(invoice);
				verify.verifyInvoice(invoice);
				invoice.setCustomerName(EcpayFunction.urlEncode(invoice.getCustomerName()));
				invoice.setCustomerAddr(EcpayFunction.urlEncode(invoice.getCustomerAddr()));
				invoice.setCustomerEmail(EcpayFunction.urlEncode(invoice.getCustomerEmail()));
				invoice.setInvoiceItemName(EcpayFunction.urlEncode(invoice.getInvoiceItemName()));
				invoice.setInvoiceItemWord(EcpayFunction.urlEncode(invoice.getInvoiceItemWord()));
				invoice.setInvoiceRemark(EcpayFunction.urlEncode(invoice.getInvoiceRemark()));
			}
			out.append(genCheckOutHtmlCode(obj, invoice));
		} catch (EcpayException e) {
			e.ShowExceptionMessage();
			log.error(e.getNewExceptionMessage());
			throw new EcpayException(e.getNewExceptionMessage());
		}
		return out.toString();
	}
	
	
	/**
	 * 產生HTML code
	 * @param aio object
	 * @param invoice obj
	 * @return string
	 */
	private String genCheckOutHtmlCode(Object aio, InvoiceObj invoice){
		StringBuilder builder = new StringBuilder();
		Hashtable<String, String> fieldValue = EcpayFunction.objToHashtable(aio);
		Hashtable<String, String> invoiceField = new Hashtable<String, String>();
		if(invoice != null){
			invoiceField = EcpayFunction.objToHashtable(invoice);
			fieldValue.putAll(invoiceField);
		}
		String CheckMacValue = EcpayFunction.genCheckMacValue(HashKey, HashIV, fieldValue);
		fieldValue.put("CheckMacValue", CheckMacValue);
		Set<String> key = fieldValue.keySet();
		String name[] = key.toArray(new String[key.size()]);
		builder.append("<form id=\"allPayAPIForm\" action=\""+ aioCheckOutUrl + "\" method=\"post\">");
		for(int i = 0 ; i < name.length ; i++) {
			builder.append("<input type=\"hidden\" name=\""+name[i]+"\" value=\""+fieldValue.get(name[i])+"\">");
		}
		builder.append("<script language=\"JavaScript\">");
		builder.append("allPayAPIForm.submit()");
		builder.append("</script>");
		builder.append("</form>");
		return builder.toString();
	}
}
