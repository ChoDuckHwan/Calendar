package com.mycompany.myapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.CalendarUser;
import com.mycompany.myapp.domain.UserRole;

public class JdbcUserRoleDao implements UserRoleDao {

	private JdbcTemplate jdbcTemplate;

	private RowMapper<UserRole> rowMapper;
	
		public JdbcUserRoleDao() {
			rowMapper = new RowMapper<UserRole>() {
				public UserRole mapRow(ResultSet rs, int rowNum) throws SQLException {
					UserRole userRole = new UserRole();
					userRole.setId(rs.getInt("id"));
					userRole.setEmail(rs.getString("email"));
					userRole.setRole(rs.getString("role"));

					return userRole;
				}
			};
	}

	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
		
	@Override
	public int add(final UserRole userRole){
		KeyHolder keyHolder = new GeneratedKeyHolder();

		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement("insert into user_roles(email, role) " +	"values(?,?)", Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, userRole.getEmail());
				ps.setString(2, userRole.getRole());

				return ps;
			}
		}, keyHolder);
		return keyHolder.getKey().intValue();
	}
	
	@Override
	public void update(UserRole userRole) {
		this.jdbcTemplate.update(
				"update user_roles set role = ? where email = ? ", userRole.getRole(), userRole.getEmail());		
	}
	
	@Override
	public UserRole get(String email) {
		return this.jdbcTemplate.queryForObject("select * from user_roles where email = ?", new Object[] {email}, this.rowMapper);
	} 
}