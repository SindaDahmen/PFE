package com.nordnet.batchs.services;

import java.util.List;

import com.nordnet.batchs.dtos.BatchJobExecutionDTO;
import com.nordnet.batchs.entities.BatchJobExecution;

public interface BatchJobExecutionService extends FwkGenericService<BatchJobExecution, BatchJobExecutionDTO> {

	/**
	 * 
	 * @param batchJobExecutionId
	 * @return
	 */
	BatchJobExecutionDTO updateEndTime(Integer batchJobExecutionId);

	/**
	 * 
	 * @param batchId
	 * @return
	 */
	List<BatchJobExecutionDTO> listExecutionByBatch(Integer batchId);

	/**
	 * 
	 * @param batchId
	 * @return
	 */
	BatchJobExecutionDTO getLastJobExecution(Integer batchId);

}
