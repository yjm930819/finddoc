package doc.find.search;

import java.io.IOException;
import java.util.List;

public interface searchService {
	String search (String loctxt, String hospname, String zipCd, String dgsbjtCd) throws IOException;
	
	String dragmap(String xPos, String yPos, String radius) throws IOException;
	
	String ykiho_detailinfo(String ykiho, String path) throws IOException;
}
