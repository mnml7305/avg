package request;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *  処理を担当するクラス
 *
 */
public class RequestModel {
	/**
	 * アイテム一覧を取得して返却する
	 *
	 * @return beanList
	 */
	public ArrayList<RequestBean> getCarrierList() {

		// ResultSet を初期化
		ResultSet rs = null;

		// bean を入れるためのリスト
		ArrayList<RequestBean> beanList = new ArrayList<RequestBean>();

		// データベース接続をするために DAO をインスタンス化
		RequestDao dao = new RequestDao();

		try {
			// データを取得
			rs = dao.selectAll();

			// 取得したデータを beanList に入れるループ
			while (rs.next()) {
				RequestBean bean = new RequestBean();

				// 運送業者ID 運送業者名 を bean にセット
				bean.setcarrier_id(rs.getInt("carrier_id"));
				bean.setcarrier_name(rs.getString("carrier_name"));

				// データをセットした bean を beanList に追加
				beanList.add(bean);
			}

		} catch (SQLException e) {
			// 例外処理
			e.printStackTrace();
		} finally {
			// 処理終了時に各接続を解除
			dao.close();
		}


		return beanList;
	}
}
