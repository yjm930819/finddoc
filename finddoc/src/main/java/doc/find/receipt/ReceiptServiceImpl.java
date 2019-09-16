package doc.find.receipt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doc.find.member.HadminDTO;

@Service
public class ReceiptServiceImpl implements ReceiptService {
	@Autowired
	ReceiptDAO dao;

	@Override
	public List<HadminDTO> myhospital(String userid) {
		return dao.myhospital(userid);
	}

	@Override
	public int book(ReceiptDTO receiptDTO) {
		return dao.book(receiptDTO);
	}

	@Override
	public List<ReceiptDTO> receiptlist(String userid) {
		return dao.receiptlist(userid);
	}

	@Override
	public int cancelreceipt(ReceiptDTO receiptDTO) {
		return dao.cancelreceipt(receiptDTO);
	}

	@Override
	public ReceiptDTO receiptinfo(String receiptnum) {
		return dao.receiptinfo(receiptnum);
	}

	@Override
	public int receiptupdate(ReceiptDTO receiptDTO) {
		return dao.receiptupdate(receiptDTO);
	}

	@Override
	public List<ReceiptDTO> doclist(String hadminid) {
		return dao.doclist(hadminid);
	}

	@Override
	public int docok(ReceiptDTO receiptDTO) {
		return dao.docok(receiptDTO);
	}

}
