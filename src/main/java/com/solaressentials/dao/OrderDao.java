package com.solaressentials.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.solaressentials.model.Order;
import com.solaressentials.model.Product;

public class OrderDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public OrderDao(Connection con) {
		this.con = con;
	}

	public boolean insertOrder(Order order) {
		boolean result = false;
		try {
			query = "insert into orders(productId,userId,quantity,date) values(?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, order.getId());
			pst.setInt(2, order.getUid());
			pst.setInt(3, order.getQuantity());
			pst.setString(4, order.getDate());
			pst.executeUpdate();
			result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public List<Order> userOrders(int id) {
		List<Order> list = new ArrayList<>();
		try {
			query = "select * from orders where userId=? order by orders.id desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				ProductDao productDao = new ProductDao(this.con);
				int pId = rs.getInt("productId");
				Product product = productDao.getSingleProduct(pId);
				order.setOrderId(rs.getInt("id"));
				order.setId(pId);
				order.setName(product.getName());
				order.setCategory(product.getCategory());
				order.setPrice(product.getPrice() * rs.getInt("quantity"));
				order.setQuantity(rs.getInt("quantity"));
				order.setDate(rs.getString("date"));
				list.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void cancleOrder(int id) {
		try {
			query = "delete from orders where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			pst.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
