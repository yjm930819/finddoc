package doc.find.receipt;

import java.util.List;

import doc.find.member.HadminDTO;

public interface ReceiptService {
	// 자주가는병원리스트
	List<HadminDTO> myhospital(String userid);

	// 접수하기
	int book(ReceiptDTO receiptDTO);

	// 접수목록
	List<ReceiptDTO> receiptlist(String userid);

	// 접수취소
	int cancelreceipt(ReceiptDTO receiptDTO);

	// 접수상세내역
	ReceiptDTO receiptinfo(String receiptnum);

	// 접수 수정
	int receiptupdate(ReceiptDTO receiptDTO);

	// 병원관리자가 보는 접수목록
	List<ReceiptDTO> doclist(String hadminid);

	// 병원관리자가 진료완료
	int docok(ReceiptDTO receiptDTO);
}
