package com.nordnet.batchs.entities;

import static javax.persistence.GenerationType.IDENTITY;

// Generated 24 mars 2017 10:30:00 by Hibernate Tools 3.4.0.CR1

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
//import javax.persistence.Version;

/**
 * BatchStepExecution generated by hbm2java
 */
@Entity
@Table(name = "batch_step_execution")
public class BatchStepExecution implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private long stepExecutionId;
	private Long version;
	private BatchJobExecution batchJobExecution;
	private String stepName;
	private Date startTime;
	private Date endTime;
	private String status;
	private Long commitCount;
	private Long readCount;
	private Long filterCount;
	private Long writeCount;
	private Long readSkipCount;
	private Long writeSkipCount;
	private Long processSkipCount;
	private Long rollbackCount;
	private String exitCode;
	private String exitMessage;
	private Date lastUpdated;
	private BatchStepExecutionContext batchStepExecutionContext;

	public BatchStepExecution() {
	}

	public BatchStepExecution(long stepExecutionId) {
		this.stepExecutionId = stepExecutionId;
	}

	public BatchStepExecution(long stepExecutionId, BatchJobExecution batchJobExecution, String stepName,
			Date startTime, Date endTime, String status, Long commitCount, Long readCount, Long filterCount,
			Long writeCount, Long readSkipCount, Long writeSkipCount, Long processSkipCount, Long rollbackCount,
			String exitCode, String exitMessage, Date lastUpdated,
			BatchStepExecutionContext batchStepExecutionContext) {
		this.stepExecutionId = stepExecutionId;
		this.batchJobExecution = batchJobExecution;
		this.stepName = stepName;
		this.startTime = startTime;
		this.endTime = endTime;
		this.status = status;
		this.commitCount = commitCount;
		this.readCount = readCount;
		this.filterCount = filterCount;
		this.writeCount = writeCount;
		this.readSkipCount = readSkipCount;
		this.writeSkipCount = writeSkipCount;
		this.processSkipCount = processSkipCount;
		this.rollbackCount = rollbackCount;
		this.exitCode = exitCode;
		this.exitMessage = exitMessage;
		this.lastUpdated = lastUpdated;
		this.batchStepExecutionContext = batchStepExecutionContext;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "STEP_EXECUTION_ID", unique = true, nullable = false)
	public long getStepExecutionId() {
		return this.stepExecutionId;
	}

	public void setStepExecutionId(long stepExecutionId) {
		this.stepExecutionId = stepExecutionId;
	}

	// @Version
	@Column(name = "VERSION")
	public Long getVersion() {
		return this.version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "JOB_EXECUTION_ID")
	public BatchJobExecution getBatchJobExecution() {
		return this.batchJobExecution;
	}

	public void setBatchJobExecution(BatchJobExecution batchJobExecution) {
		this.batchJobExecution = batchJobExecution;
	}

	@Column(name = "STEP_NAME", length = 45)
	public String getStepName() {
		return this.stepName;
	}

	public void setStepName(String stepName) {
		this.stepName = stepName;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_TIME", length = 19)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "END_TIME", length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "STATUS", length = 10)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Column(name = "COMMIT_COUNT")
	public Long getCommitCount() {
		return this.commitCount;
	}

	public void setCommitCount(Long commitCount) {
		this.commitCount = commitCount;
	}

	@Column(name = "READ_COUNT")
	public Long getReadCount() {
		return this.readCount;
	}

	public void setReadCount(Long readCount) {
		this.readCount = readCount;
	}

	@Column(name = "FILTER_COUNT")
	public Long getFilterCount() {
		return this.filterCount;
	}

	public void setFilterCount(Long filterCount) {
		this.filterCount = filterCount;
	}

	@Column(name = "WRITE_COUNT")
	public Long getWriteCount() {
		return this.writeCount;
	}

	public void setWriteCount(Long writeCount) {
		this.writeCount = writeCount;
	}

	@Column(name = "READ_SKIP_COUNT")
	public Long getReadSkipCount() {
		return this.readSkipCount;
	}

	public void setReadSkipCount(Long readSkipCount) {
		this.readSkipCount = readSkipCount;
	}

	@Column(name = "WRITE_SKIP_COUNT")
	public Long getWriteSkipCount() {
		return this.writeSkipCount;
	}

	public void setWriteSkipCount(Long writeSkipCount) {
		this.writeSkipCount = writeSkipCount;
	}

	@Column(name = "PROCESS_SKIP_COUNT")
	public Long getProcessSkipCount() {
		return this.processSkipCount;
	}

	public void setProcessSkipCount(Long processSkipCount) {
		this.processSkipCount = processSkipCount;
	}

	@Column(name = "ROLLBACK_COUNT")
	public Long getRollbackCount() {
		return this.rollbackCount;
	}

	public void setRollbackCount(Long rollbackCount) {
		this.rollbackCount = rollbackCount;
	}

	@Column(name = "EXIT_CODE", length = 2500)
	public String getExitCode() {
		return this.exitCode;
	}

	public void setExitCode(String exitCode) {
		this.exitCode = exitCode;
	}

	@Column(name = "EXIT_MESSAGE", length = 2500)
	public String getExitMessage() {
		return this.exitMessage;
	}

	public void setExitMessage(String exitMessage) {
		this.exitMessage = exitMessage;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LAST_UPDATED", length = 19)
	public Date getLastUpdated() {
		return this.lastUpdated;
	}

	public void setLastUpdated(Date lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	// @Cascade(CascadeType.ALL)
	@OneToOne(fetch = FetchType.LAZY, mappedBy = "batchStepExecution", cascade = CascadeType.ALL)
	public BatchStepExecutionContext getBatchStepExecutionContext() {
		return this.batchStepExecutionContext;
	}

	public void setBatchStepExecutionContext(BatchStepExecutionContext batchStepExecutionContext) {
		this.batchStepExecutionContext = batchStepExecutionContext;
	}

}