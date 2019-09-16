package doc.find.receipt;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import doc.find.member.HadminDTO;

@Repository
public class ReceiptDAOImpl implements ReceiptDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<HadminDTO> myhospital(String userid) {
		return sqlSession.selectList("finddoc.receipt.myhoslist", userid);
	}

	@Override
	public int book(ReceiptDTO receiptDTO) {
		return sqlSession.insert("finddoc.receipt.receipt", receiptDTO);
	}

	@Override
	public List<ReceiptDTO> receiptlist(String userid) {
		return sqlSession.selectList("finddoc.receipt.receiptlist", userid);
	}

	@Override
	public int cancelreceipt(ReceiptDTO receiptDTO) {
		return sqlSession.update("finddoc.receipt.cancel", receiptDTO);
	}

	@Override
	public ReceiptDTO receiptinfo(String receiptnum) {
		return sqlSession.selectOne("finddoc.receipt.receiptinfo", receiptnum);
	}

	@Override
	public int receiptupdate(ReceiptDTO receiptDTO) {
		return sqlSession.update("finddoc.receipt.receiptupdate", receiptDTO);
	}

	@Override
	public List<ReceiptDTO> doclist(String hadminid) {
		return sqlSession.selectList("finddoc.receipt.doclist", hadminid);
	}

	@Override
	public int docok(ReceiptDTO receiptDTO) {
		return sqlSession.update("finddoc.receipt.docok", receiptDTO);
	}

}
