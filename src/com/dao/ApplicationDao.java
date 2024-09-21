package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.beans.Application;
import com.beans.CompNotification;
import com.beans.Notification;

@Repository
public class ApplicationDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	///////////////////////////////
	public List<Notification> getApplications() {
		String sql = "SELECT a.application_id, a.job_id, a.job_seeker_id, a.application_date, a.status, "
				+ "j.job_title,js.cv, u.user_id, u.username " + "FROM applications a "
				+ "JOIN jobs j ON a.job_id = j.job_id " + "JOIN jobseekers js ON a.job_seeker_id = js.job_seeker_id "
				+ "JOIN users u ON js.user_id = u.user_id WHERE a.status = 'Pending'";

		return jdbcTemplate.query(sql, new ApplicationRowMapper());
	}

	private static class ApplicationRowMapper implements RowMapper<Notification> {
		@Override
		public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
			Notification application = new Notification();
			application.setApplicationId(rs.getInt("application_id"));
			application.setJobId(rs.getInt("job_id"));
			application.setJobSeekerId(rs.getInt("job_seeker_id"));
			application.setApplicationDate(rs.getTimestamp("application_date"));
			application.setStatus(rs.getString("status"));
			application.setJobTitle(rs.getString("job_title"));
			application.setUserId(rs.getInt("user_id"));
			application.setUsername(rs.getString("username"));
			application.setCv(rs.getString("cv"));
			return application;
		}
	}

	public List<Notification> getAcceptedApplications() {
		String sql = "SELECT a.application_id, a.job_id, a.job_seeker_id, a.application_date, a.status, "
				+ "j.job_title,js.cv, u.user_id, u.username " + "FROM applications a "
				+ "JOIN jobs j ON a.job_id = j.job_id " + "JOIN jobseekers js ON a.job_seeker_id = js.job_seeker_id "
				+ "JOIN users u ON js.user_id = u.user_id WHERE a.status = 'Accepted'";

		return jdbcTemplate.query(sql, new ApplicationRowMapper());
	}

	private static class AccpetedApplicationRowMapper implements RowMapper<Notification> {
		@Override
		public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
			Notification application = new Notification();
			application.setApplicationId(rs.getInt("application_id"));
			application.setJobId(rs.getInt("job_id"));
			application.setJobSeekerId(rs.getInt("job_seeker_id"));
			application.setApplicationDate(rs.getTimestamp("application_date"));
			application.setStatus(rs.getString("status"));
			application.setJobTitle(rs.getString("job_title"));
			application.setUserId(rs.getInt("user_id"));
			application.setUsername(rs.getString("username"));
			application.setCv(rs.getString("cv"));
			return application;
		}
	}

	public List<Notification> getRejectedApplications() {
		String sql = "SELECT a.application_id, a.job_id, a.job_seeker_id, a.application_date, a.status, "
				+ "j.job_title,js.cv, u.user_id, u.username " + "FROM applications a "
				+ "JOIN jobs j ON a.job_id = j.job_id " + "JOIN jobseekers js ON a.job_seeker_id = js.job_seeker_id "
				+ "JOIN users u ON js.user_id = u.user_id WHERE a.status = 'Rejected'";

		return jdbcTemplate.query(sql, new ApplicationRowMapper());
	}

	private static class RejectedApplicationRowMapper implements RowMapper<Notification> {
		@Override
		public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
			Notification application = new Notification();
			application.setApplicationId(rs.getInt("application_id"));
			application.setJobId(rs.getInt("job_id"));
			application.setJobSeekerId(rs.getInt("job_seeker_id"));
			application.setApplicationDate(rs.getTimestamp("application_date"));
			application.setStatus(rs.getString("status"));
			application.setJobTitle(rs.getString("job_title"));
			application.setUserId(rs.getInt("user_id"));
			application.setUsername(rs.getString("username"));
			application.setCv(rs.getString("cv"));
			return application;
		}
	}

	public void approveApplication(int id, int jid) {
		String sql = "UPDATE applications SET status = 'Accepted' WHERE application_id = ?";
		String sql1 = "UPDATE notifications SET status = 'Read' WHERE job_id = ?";
		jdbcTemplate.update(sql, id);
		jdbcTemplate.update(sql1, id);
	}

	public void rejectApplication(int id, int jid) {
		String sql = "UPDATE applications SET status = 'Rejected' WHERE job_id = ?";
		String sql1 = "UPDATE notifications SET status = 'Read' WHERE job_id = ?";
		jdbcTemplate.update(sql, id);
		jdbcTemplate.update(sql1, id);
	}

	////////////////////////////////
	public void saveApplication(Application application) {
		String sql = "INSERT INTO Applications (job_id, job_seeker_id, application_date, status) VALUES (?, ?, ?, ?)";
		try {
			jdbcTemplate.update(sql, application.getJobId(), application.getJobSeekerId(),
					application.getApplicationDate(), application.getStatus());
			System.out.println("Application saved successfully for job seeker ID " + application.getJobSeekerId());
		} catch (Exception e) {
			System.err.println("Error saving application for job seeker ID " + application.getJobSeekerId() + ": "
					+ e.getMessage());
		}
	}

	public boolean hasResume(int jobSeekerId) {
		String sql = "SELECT cv FROM JobSeekers WHERE job_seeker_id = ?";
		// Handling potential null values and checking if resume exists
		String resumePath = null;
		try {
			resumePath = jdbcTemplate.queryForObject(sql, new Object[] { jobSeekerId }, String.class);
		} catch (Exception e) {
			// Log the exception and handle it if needed
			System.err.println("Error checking resume for job seeker ID " + jobSeekerId + ": " + e.getMessage());
		}
		return resumePath != null && !resumePath.trim().isEmpty();
	}

//    public boolean isResumeFileNull(Integer jobSeekerId) {
//    	 System.out.println("isNullcheck");
//        String sql = "SELECT cv IS NULL FROM jobseekers WHERE job_seeker_id = ?";       
//        return jdbcTemplate.queryForObject(sql, new Object[]{jobSeekerId}, Boolean.class);
//    }

//    public boolean isResumeFileNull(Integer jobSeekerId) {
//        String sql = "SELECT CASE WHEN cv IS NULL THEN TRUE ELSE FALSE END FROM jobseekers WHERE job_seeker_id = ?";
//        return Boolean.TRUE.equals(jdbcTemplate.queryForObject(sql, new Object[]{jobSeekerId}, Boolean.class));
//    }

	public void updateResumePath(int jobSeekerId, String resumePath) {
		String sql = "UPDATE JobSeekers SET cv = ? WHERE job_seeker_id = ?";
		try {
			int rowsAffected = jdbcTemplate.update(sql, resumePath, jobSeekerId);
			if (rowsAffected > 0) {
				System.out.println("Resume path updated successfully for job seeker ID " + jobSeekerId);
				System.out.println("uploaded into database");
			} else {
				System.out.println("No job seeker found with ID " + jobSeekerId);
			}

		} catch (Exception e) {
			// Log the exception for debugging purposes
			System.err.println("Error updating resume path for job seeker ID " + jobSeekerId + ": " + e.getMessage());
		}
	}

	public void saveNotification(CompNotification notification) {
		String sql = "INSERT INTO notifications (company_id, message, notification_type, status,job_id) VALUES (?, ?, ?, ?,?)";
		jdbcTemplate.update(sql, notification.getCompanyId(), notification.getMessage(),
				notification.getNotificationType(), notification.getStatus(), notification.getJobId());
		System.out.println("noti saved successfully.");
	}

	public List<Map<String, Object>> getGeneralNotificationsByCompanyId(Integer compId) {
//		String sql = "SELECT * " + "FROM notifications n " + "JOIN jobs j ON n.job_id = j.job_id "
//				+ "WHERE j.company_id = ?";
		String sql = "SELECT * FROM notifications n " + "JOIN jobs j ON n.job_id = j.job_id "
				+ "WHERE j.company_id = ? " + "AND n.notification_type != 'Payment' "
				+ "ORDER BY CASE WHEN n.status = 'Unread' THEN 1 ELSE 2 END";
		return jdbcTemplate.queryForList(sql, new Object[] { compId });
	}

	public List<Map<String, Object>> getPaymentNotificationsByCompanyId(Integer compId) {
//		String sql = "SELECT * " + "FROM notifications n " + "JOIN jobs j ON n.job_id = j.job_id "
//				+ "WHERE j.company_id = ?";
		String sql = "SELECT * FROM notifications n " + "JOIN jobs j ON n.job_id = j.job_id "
				+ "WHERE j.company_id = ? " + "AND n.notification_type = 'Payment' "
				+ "ORDER BY CASE WHEN n.status = 'Unread' THEN 1 ELSE 2 END";
		return jdbcTemplate.queryForList(sql, new Object[] { compId });
	}

	public int applicationCount(int compId) {
		String sql = "SELECT COUNT(*) FROM notifications WHERE company_id = ?";

		return jdbcTemplate.queryForObject(sql, new Object[] { compId }, Integer.class);
//		return count; // Return true if the combination of skill and userId is unique
	}

	public int jsapplicationCount(int jsId) {
		String sql = "SELECT COUNT(*) FROM applications where job_seeker_id=? and  noti_status IS NULL and status != 'Pending'";

		return jdbcTemplate.queryForObject(sql, new Object[] { jsId }, Integer.class);
//		return count; // Return true if the combination of skill and userId is unique
	}

	public List<Map<String, Object>> getGeneralNotificationsByJSId(Integer jsId) {

		String sql = "SELECT * FROM applications where job_seeker_id=? and noti_status IS NULL and status != 'Pending'";
		try {
			return jdbcTemplate.queryForList(sql, new Object[] { jsId });
		} catch (EmptyResultDataAccessException e) {
			return null;
		}

	}

	public int deleteJSNoti(int notiId) {
		String sql = "UPDATE applications SET noti_status = 'Read' WHERE application_id = ?";
		return jdbcTemplate.update(sql, notiId);
	}

}
