package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class convertData {
	
	public List<Map<String, Object>> convertData(ResultSet resultSet) {
		List<Map<String, Object>> productList = new ArrayList<>();


		try {
			if(resultSet!=null) {
			while (resultSet.next()) {
			    ResultSetMetaData metaData = (ResultSetMetaData) resultSet.getMetaData();
			    int columnCount = metaData.getColumnCount();
			    Map<String, Object> row = new HashMap<>();

			    for (int i = 1; i <= columnCount; i++) {
			        String columnName = metaData.getColumnName(i);
			        Object columnValue = resultSet.getObject(i);
			        row.put(columnName, columnValue);
			    }

			    productList.add(row);
			}
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return productList;
	}

}
