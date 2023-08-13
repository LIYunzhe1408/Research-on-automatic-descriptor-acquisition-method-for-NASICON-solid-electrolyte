/*
 Navicat Premium Data Transfer

 Source Server         : what
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : xai

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 31/03/2023 11:21:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for entity_library
-- ----------------------------
DROP TABLE IF EXISTS `entity_library`;
CREATE TABLE `entity_library`  (
  `entity_id` int(11) NULL DEFAULT NULL,
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentence_id` int(255) NULL DEFAULT NULL,
  `entity_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentence_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `predicate_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `sentence_id`(`sentence_id`) USING BTREE,
  INDEX `doi`(`doi`) USING BTREE,
  CONSTRAINT `entity_library_ibfk_1` FOREIGN KEY (`sentence_id`) REFERENCES `lit_sentence` (`sentence_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `entity_library_ibfk_2` FOREIGN KEY (`doi`) REFERENCES `lit_sentence` (`doi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of entity_library
-- ----------------------------
INSERT INTO `entity_library` VALUES (1, NULL, 1, 'CE model', 'Due to the specific assignment of sigma = 0 for any Na / Si occupation, only clusters that are fully constituted by Va and / or by P contribute to non-zero ECIs to-wards the overall energy estimation in our CE model .', 'Characterization');
INSERT INTO `entity_library` VALUES (2, NULL, 1, 'overall energy', 'Due to the specific assignment of sigma = 0 for any Na / Si occupation, only clusters that are fully constituted by Va and / or by P contribute to non-zero ECIs to-wards the overall energy estimation in our CE model .', 'Property');
INSERT INTO `entity_library` VALUES (3, NULL, 2, 'high energies', 'We removed selected structures, primarily at x = 0 and 0 . 25, whose high energies originate from the unfavourable ordering of Na in the structure while making the fitting of the CE extremely challenging .', 'Feature');
INSERT INTO `entity_library` VALUES (4, NULL, 2, 'Na', 'We removed selected structures, primarily at x = 0 and 0 . 25, whose high energies originate from the unfavourable ordering of Na in the structure while making the fitting of the CE extremely challenging .', 'Composition');
INSERT INTO `entity_library` VALUES (5, NULL, 3, 'NaSiCON', 'Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 'Composition');
INSERT INTO `entity_library` VALUES (6, NULL, 3, 'rhombohedral', 'Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 'Structure');
INSERT INTO `entity_library` VALUES (7, NULL, 3, 'phase separation', 'Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 'Property');
INSERT INTO `entity_library` VALUES (8, NULL, 3, 'biphasic be-havior', 'Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 'Property');

-- ----------------------------
-- Table structure for lit_author
-- ----------------------------
DROP TABLE IF EXISTS `lit_author`;
CREATE TABLE `lit_author`  (
  `author_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`author_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lit_author
-- ----------------------------
INSERT INTO `lit_author` VALUES (12, 'Ashish Vaswani', 'Adept AI');

-- ----------------------------
-- Table structure for lit_info
-- ----------------------------
DROP TABLE IF EXISTS `lit_info`;
CREATE TABLE `lit_info`  (
  `topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reference_id` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`doi`) USING BTREE,
  INDEX `reference_id`(`reference_id`) USING BTREE,
  CONSTRAINT `lit_info_ibfk_1` FOREIGN KEY (`reference_id`) REFERENCES `lit_reference` (`reference_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lit_info
-- ----------------------------
INSERT INTO `lit_info` VALUES (NULL, '110', NULL);
INSERT INTO `lit_info` VALUES (NULL, '110_', NULL);
INSERT INTO `lit_info` VALUES (NULL, '120', NULL);
INSERT INTO `lit_info` VALUES (NULL, '132', NULL);
INSERT INTO `lit_info` VALUES (NULL, '137', NULL);
INSERT INTO `lit_info` VALUES (NULL, '304', NULL);
INSERT INTO `lit_info` VALUES (NULL, '67', NULL);
INSERT INTO `lit_info` VALUES (NULL, '82', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Internal short circuit detection in Li-ion batteries using supervised machine learning', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Lithium-Sulfur Battery State-of-Charge Observability Analysis and Estimation', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Machine Learning Approaches for Designing Mesoscale Structure of Li-Ion Battery Electrodes', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Molecular structure-redox potential relationship for organic electrode materials', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Reinforcement Learning-based Fast Charging Control Strategy for Li-ion Batteries', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking', NULL);
INSERT INTO `lit_info` VALUES (NULL, 'Statistical learning for accurate and interpretable battery lifetime prediction', NULL);

-- ----------------------------
-- Table structure for lit_reference
-- ----------------------------
DROP TABLE IF EXISTS `lit_reference`;
CREATE TABLE `lit_reference`  (
  `reference_id` int(255) NOT NULL,
  `reference_topic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` int(255) NULL DEFAULT NULL,
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`reference_id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  INDEX `doi`(`doi`) USING BTREE,
  CONSTRAINT `lit_reference_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `lit_author` (`author_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `lit_reference_ibfk_2` FOREIGN KEY (`doi`) REFERENCES `lit_info` (`doi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lit_reference
-- ----------------------------

-- ----------------------------
-- Table structure for lit_sentence
-- ----------------------------
DROP TABLE IF EXISTS `lit_sentence`;
CREATE TABLE `lit_sentence`  (
  `sentence_id` int(255) NOT NULL,
  `sentence_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sentence_id`) USING BTREE,
  INDEX `doi`(`doi`) USING BTREE,
  CONSTRAINT `lit_sentence_ibfk_1` FOREIGN KEY (`doi`) REFERENCES `lit_info` (`doi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lit_sentence
-- ----------------------------
INSERT INTO `lit_sentence` VALUES (1, 'At present , the energy source of these equipment \' s for mounting their LED lights , global positioning system ( GPS ) , and monitoring systems are lead - acid batteries .', '137');
INSERT INTO `lit_sentence` VALUES (2, 'Optimizing the SPS temperature is important to achieve desirable density and hence ionic conductance .', '110');
INSERT INTO `lit_sentence` VALUES (3, 'Our approach will enhance the total Li conductivity of oxide - based SEs and , by extension , improve the electrochemical performance of ASBs as future energy storage systems .', '67');
INSERT INTO `lit_sentence` VALUES (4, 'Several solid electrolytes based on polymer , ceramic oxides , ceramic sulfides , and hybrid polymer - ceramic materials have been reported and applied in ASSLB studies .', '120');
INSERT INTO `lit_sentence` VALUES (5, 'The site occupancy analysis by topology - based method assigns the migration ions to the sites based on convex - hull analysis of site polyhedra .', '132');
INSERT INTO `lit_sentence` VALUES (6, 'Nonspin - polarized AIMD simulations were carried out for the canonical ensemble using a Hoover thermostat at four elevated temperatures ( 800 K , 1000 K , 1200 K , and 1400 K ) in order to observe the diffusive behavior for the Na + ions over the time scale of the simulations .', '132');
INSERT INTO `lit_sentence` VALUES (7, 'Table 1 gives these lattice parameters and the crystallite sizes of LAGP in the as - made cell and after cycling for 340 h .', '120');
INSERT INTO `lit_sentence` VALUES (8, 'Different observers , such as extended Kalman filter ( EKF ) , Luenberger observer , have been employed to generate the residual signal from the measured data for the ISC detection .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (9, 'From fig 11 , the ME and RMSE for these two GPR models are within 0 . 71Ah and 0 . 31Ah , which are 32 . 6 % and 13 . 6 % less than those from SEGM .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (10, 'RF has been applied successfully to various classification profiles such as sleep stages classifications from the electroencephalography ( EEG ) data , bearing faults identification from the vibration data , facial expression detection from video data , crops type classification from the hyper spectral images , lung vessel segmentation from computed tomography ( CT ) image , etc .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (11, 'Choi et al developed a Feedforward Neural Network ( FNN ) , a CNN and a Long Short - Term Memory ( LSTM ) network to estimate the capacity of Li - Ion batteries from their voltage profiles , current profiles and temperature charge profiles .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (12, 'The maximal releasable capacity can be computed by inte - grating the discharge current of the fully charged battery overtime .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (13, 'Li - air batteries ( LABs ) are considered promising alternative energy storage systems for Li - ion batteries because of their huge energy density .', '110_');
INSERT INTO `lit_sentence` VALUES (14, 'Since publication of the Severson et al dataset , others have applied advanced machine learning and deep learning methods , including relevance vector machines , gradient boosted regression trees , Gaussian process regression , recurrent neural networks ( including long short - term memory networks ) , and convolutional neural networks .', 'Statistical learning for accurate and interpretable battery lifetime prediction');
INSERT INTO `lit_sentence` VALUES (15, 'In the first step , high - throughput Physico - chemical modeling based on particles aggregated structures are developed .', 'Machine Learning Approaches for Designing Mesoscale Structure of Li-Ion Battery Electrodes');
INSERT INTO `lit_sentence` VALUES (16, 'The computational investigations based on CE were successful in predicting crucial aspects of DRS materials such as order - disorder phase transition and open - circuit voltage profile .', 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors');
INSERT INTO `lit_sentence` VALUES (17, 'In this article , an invariant - learning based sequential stage division method is proposed , which is capable of providing reliable and unique results .', 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation');
INSERT INTO `lit_sentence` VALUES (18, 'Weng et al developed a model based on Support Vector Regression ( SVR ) , using partially charging data of a single Li - Ion cell to estimate capacity fading of other 7 cells .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (19, 'LASSO is based on the least - squares regression method , which is much less intensive in computation than the other machine learning methods used in this study .', 'Molecular structure-redox potential relationship for organic electrode materials');
INSERT INTO `lit_sentence` VALUES (20, 'In the second step , the regression model in order to predict the charge - discharge resistance is developed using process parameters as predictors via Artificial Neural Network ( ANN ) .', 'Machine Learning Approaches for Designing Mesoscale Structure of Li-Ion Battery Electrodes');
INSERT INTO `lit_sentence` VALUES (21, 'The optimized electrode structures and the process parameters are searched by Bayesian optimization in the final step .', 'Machine Learning Approaches for Designing Mesoscale Structure of Li-Ion Battery Electrodes');
INSERT INTO `lit_sentence` VALUES (22, 'Measurable battery parameters such as terminal voltage , current and temperature , can be extracted via the Controller Area Network ( CAN ) bus , and can be used for capacity fading and SoH estimation .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (23, 'In the literature , various intelligent techniques were successfully devised for cyclic capacity prediction , such as support vector machine ( SVM ) and artificial neural network ( ANN ) .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (24, 'A total of 11 features are devised and investigated to fit the lithium diffusion characteristics calculated using the NEB method .', 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors');
INSERT INTO `lit_sentence` VALUES (25, 'Here , Extra Gradient Boosting ( XGBoost ) method is applied to solve the terminal voltage prediction issue , since this method has already be proven to outperform common ML techniques .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (26, 'The Adaptive Moment Estimation ( Adam ) optimization algorithm was used to train to networks due to its efficiency in terms of adaptive learning rate method and its suitability to non - stationary profiles .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (27, 'The fluctuating current for the full - states actor - critic network could be mitigated by regularizing the actor - critic parameters during learning .', 'Reinforcement Learning-based Fast Charging Control Strategy for Li-ion Batteries');
INSERT INTO `lit_sentence` VALUES (28, 'A commonly used approach is to use Cluster Expansion ( CE ) in conjunction with first - principles simulations such as density functional theory ( DFT ) calculations .', 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors');
INSERT INTO `lit_sentence` VALUES (29, 'For all of the aforementioned GPR technologies , just the conventional kernel functions were studied in battery cyclic capacity predictions .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (30, 'The sumanene derivatives are a class of p - conjugated fullerene fragments that consist of a central benzene ring surrounded by alternating cyclopentadiene rings and benzene rings .', 'Molecular structure-redox potential relationship for organic electrode materials');
INSERT INTO `lit_sentence` VALUES (31, 'Mechanical abuse to the battery may lead to internal short circuit ( ISC ) .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (32, 'The effectiveness of the proposed IndRNN based SOH estimation approach is verified by comparing it with similar RNN architectures , and the IndRNN resulted in having a much lower mean square error ( RMSE ) rate of 1 . 33 % .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (33, 'Prediction performance is evaluated on the removed instances by applying most - commonly used metrics , such as Root Mean Square Error ( RMSE ) , Mean Absolute Error ( MAE ) and Mean Absolute Percentage Error ( MAPE ) .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (34, 'The projector augmented - wave ( PAW ) method was used to describe electron - ion interaction', 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors');
INSERT INTO `lit_sentence` VALUES (35, 'As described in Subsection III . B , we formulate a competitive GPR model ( Model A ) by using the ARD - SE kernel .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (36, 'For the model - based methods , a proper model with some prior information of a battery , such as the electrochemical models ( EMs ) , equivalent circuit models ( ECMs ) , together with some recursive observers such as the Kalman filter and particle filter , are applied to capture and update the battery capacity related parameters based on the data obtained during charging / discharging conditions .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (37, 'Another research work pro - poses an Independently Recurrent Neural Network ( IndRNN ) for SOH estimation which uses randomized battery usagedata collected from Li - Ion batteries adopting dynamic load profiles , obtaining a Root Mean Squared Error ( RMSE ) of 0 . 0133 and a Mean Absolute Error ( MAE ) of 0 . 0114 .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (38, 'Considering that capacity fading reflects the internal dynamics of measurements ( voltage , current , and temperature in LiB ) , it is more reasonable to separate the whole degradation procedure according to the dynamical changes of these process variables .', 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation');
INSERT INTO `lit_sentence` VALUES (39, 'Additionally , an RF approach for SoH prediction is presented .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (40, 'In Severson et al , a model with a single feature extracted from the voltage vs . discharge capacity curves , provided comparable accuracy to multivariate models with features from additional data sources such as internal resistance and can temperature .', 'Statistical learning for accurate and interpretable battery lifetime prediction');
INSERT INTO `lit_sentence` VALUES (41, 'We have proposed a data - driven approach for designing mesoscale porous structures of Li - ion battery electrode with three - dimensional virtual structures and machine learning techniques .', 'Machine Learning Approaches for Designing Mesoscale Structure of Li-Ion Battery Electrodes');
INSERT INTO `lit_sentence` VALUES (42, 'Resulting from performance degradation , battery capacity is adopted as an indicator to indicate battery health state via available amount , which will fade due to battery aging .', 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation');
INSERT INTO `lit_sentence` VALUES (43, 'Prediction - error minimization ( PEM ) algorithm and adaptive neuro - fuzzy inference system ( ANFIS ) in combina - tion with coulomb counting are used for model identification and SOC estimation , respectively .', 'Lithium-Sulfur Battery State-of-Charge Observability Analysis and Estimation');
INSERT INTO `lit_sentence` VALUES (44, 'Experimental results indicate that the IndRNN based model is able to predict a battery \' s SOH accurately with root mean square error ( RMSE ) reduced to 1 . 33 % and mean absolute error ( MAE ) reduced to 1 . 14 % .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (45, 'For example , a Convolutional Neural Network ( CNN ) was used to estimate SoH from raw battery measurements , obtaining excellent results .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (46, 'A data - driven battery aging prediction using the random forest ( RF ) algorithm is proposed together with users \' behavior and ambient conditions in Section 4 .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (47, 'In the case of ISC , SOC at the end of charging will be more than the normal case because of the leakage current ( Isc ) .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (48, 'To eliminate such limitations , this research work proposes a data - driven technique to predict SOH based on vital data such as voltage ( V ) , current ( I ) and temperature ( T ) collected from LIBs under variable load conditions .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (49, 'The published data is obtained by repeated cycles of ( LSTM ) NNs and Multi Layer Perceptrons ( MLPs ) in SoC prediction is charging and discharging with C - rates of C / 2 and C / 4 .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (50, 'Three different learning models are trained , namely artificial neural networks ( ANN ) , kernel ridge regression ( KRR ) , and gradient - boosting regression ( GBR ) , under three different strategies , which we call pipelines , to provide an advanced ML scheme for the accurate prediction of redox potential .', 'Molecular structure-redox potential relationship for organic electrode materials');
INSERT INTO `lit_sentence` VALUES (51, 'Beside that , a feature bank is composed of discharge profiles obtained at different C - rates .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (52, 'The former store the Q - function as a table whose entrance are the states and the actions , while the latter uses parameterized Q - function using Value Function Approximation ( VFA ) .', 'Reinforcement Learning-based Fast Charging Control Strategy for Li-ion Batteries');
INSERT INTO `lit_sentence` VALUES (53, 'Therefore , the main motive of this research work is to develop a robust SOH estimation battery model with high accuracy using an advanced deep learning neural network called an independently recurrent neural network ( IndRNN ) to capture the non - linear characteristics of Li - ion batteries .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (54, 'Based on the measured battery temperature and battery current , coefficients associated with SOH determined by fuzzy logic system .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (55, 'First , to involve the input features of cyclic temperature and DOD , a novel GPR model structure is proposed for predicting battery capacities under various cyclic conditions , where the information of capacity ageing tendency can be also leveraged .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (56, 'The partial differential equations ( PDEs ) can be grouped according to the following structures : charge conservation in solid electrodes ; charge conservation in the electrolyte , in the bulk and inside the electrode pores ; mass conservation in the solid active material ; mass conservation in the electrolyte ; electrochemical kinetics at the electrode - electrolyte interface .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (57, 'For instance , a mixture of GPR model is first presented to study the statistical properties of battery degradation process , followed by using a particle filtering to estimate battery capacities .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (58, 'Rsc is the short circuit resistance and Isc is the leakage current or the short circuit current .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (59, 'A full LIBs aging assessment is completed in three parts , including new diagnosis based state - of - health ( DB - SOH ) estimators , data - driven aging prediction , and relevant aging factors ranking .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (60, 'The modified GPR models are employed to study the underlying relationship among degraded battery capacity , cyclic temperatures and DODs .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (61, 'In this case study , we consider the minimum charging problem for an electrochemical model , whose chemistry is based on graphite anode / LiNiMnCoO2 ( NMC ) cathode cell .', 'Reinforcement Learning-based Fast Charging Control Strategy for Li-ion Batteries');
INSERT INTO `lit_sentence` VALUES (62, 'RNN has been extensively useful in natural language processing , speech recognition and machine translation by providing words or characters as input parameters .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (63, 'Fourteen health features were extracted from charge current profiles , charge voltage profiles , and charge temperature profiles to ensure accurate remaining capacity prediction .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (64, 'Specifically , for the cyclic conditions of deep cycling DOD levels and high operational temperatures such as Case 4 and Case 6 , cells generally present faster degradation trends .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (65, 'A probabilistic neural network ( PNN ) adopted to estimate SOH by performing constant current / voltage recharging and constant current discharging has been performed on 110 Li - Co batteries .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (66, 'Ri is the internal resistance of the battery which is a function of SOC .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (67, 'This battery model uses a Monte Carlo sampling method to characterize any probability density function to estimate battery SOC .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (68, 'This hypothesis is further supported by the fact that the voltage response of these LFP / graphite cells is dominated by graphite .', 'Statistical learning for accurate and interpretable battery lifetime prediction');
INSERT INTO `lit_sentence` VALUES (69, 'The second is the diagnosis - based approach called here DB - SOH , which is based on the evolution with the aging of the time - domain screenshot of some selected battery variables .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (70, 'Fracturing of the separator due to the ground impact of an electric vehicle battery which leads to ISC formation has been modelled using global finite element .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (71, 'For this purpose , an equivalent circuit battery model , called \" Thevenin model \" or one RC network model ( 1RC model ) , is used as illustrated in fig 4 ( b ) .', 'Lithium-Sulfur Battery State-of-Charge Observability Analysis and Estimation');
INSERT INTO `lit_sentence` VALUES (72, 'Optimized process parameters have been inferred from the total resistance using Bayesian optimization with the constructed ANN model .', 'Machine Learning Approaches for Designing Mesoscale Structure of Li-Ion Battery Electrodes');
INSERT INTO `lit_sentence` VALUES (73, 'In fact , eq 9b can only be utilized when the data are recorded in similar conditions : temperature or charging power .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (74, 'The most common parameter for this pur - pose is the battery \' s open - circuit - voltage ( OCV ) .', 'Lithium-Sulfur Battery State-of-Charge Observability Analysis and Estimation');
INSERT INTO `lit_sentence` VALUES (75, 'Given the increased sophistication of ANN and GBR compared to KRR , they are able to extract the complicated correlation between the original input features and the output more effectively .', 'Molecular structure-redox potential relationship for organic electrode materials');
INSERT INTO `lit_sentence` VALUES (76, 'The total number of charging events is also considered as well as the charging power , temperature , and the SoC variation .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (77, 'Using basic electronic and molecular features , three learning models , namely artificial neural network , gradient boosting regression , and kernel ridge regression , were trained through three different pipelines implementing three different levels of sophistication .', 'Molecular structure-redox potential relationship for organic electrode materials');
INSERT INTO `lit_sentence` VALUES (78, 'The stress - strain distribution under abusive conditions and the relationship with the ISC formation have been reported .', 'Internal short circuit detection in Li-ion batteries using supervised machine learning');
INSERT INTO `lit_sentence` VALUES (79, 'The developed models are validated and compared on the Nickel Manganese Cobalt Oxide ( NMC ) lithium - ion batteries with various cycling patterns .', 'Modified Gaussian Process Regression Models for Cyclic Capacity Prediction of Lithium-Ion Batteries');
INSERT INTO `lit_sentence` VALUES (80, 'The first is the above described WLTP - type load condition .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (81, 'We hypothesize that , while electron transport can be uniform due to the transport is still restricted due to immetallic Cr protection layer , Li perfect contact , which can lead to preferential localized growth of the interphase .', '304');
INSERT INTO `lit_sentence` VALUES (82, 'A density of 0 . 2 mA cm 6 nm layer of Al2O3 alone at the interface did not result in improved stability ( Figure 3d ) , indicating that the Cr layer was again necessary .', '304');
INSERT INTO `lit_sentence` VALUES (83, 'As can be seen in Figure 2a , there is good general agreement between the topology of the ionic - conduction pathways and the result of BVEL .', '132');
INSERT INTO `lit_sentence` VALUES (84, 'As shown in Figure 6a , with the increase in simulation temperature or Na + concentration , the percentage of correlated jumps increases which indicate that more Na + ions diffuse in the concerted migration mechanism with lower migration barrier .', '132');
INSERT INTO `lit_sentence` VALUES (85, 'The extended cyclability attained with Cr is again connected to the improved chemo - mechanical stability of the LAGP pellet .', '304');
INSERT INTO `lit_sentence` VALUES (86, 'Sn coatings were achieved by radio frequency ( RF ) magnetron sputtering using a Kurt J . Lesker Lab 18 thin film deposition system and a pure Sn target ( 99 . 99 % , SCI Engineering Materials , 3 inch diameter ) .', '82');
INSERT INTO `lit_sentence` VALUES (87, 'We observe that with the increase of Na + concentration and temperature , the jump frequency increases .', '132');
INSERT INTO `lit_sentence` VALUES (88, 'Our new cell design based on a polypropylene window may help in future experiments regarding the investigation of thin lithium metal and the ceramic solid electrolyte interface .', '120');
INSERT INTO `lit_sentence` VALUES (89, 'In this work , we identified that the highly reversible insertion of Ca ions into NASICON - type NaV2 ( PO4 ) 3 flakes it a potential nonaqueous Ca cathode material with a high energy density .', '132');
INSERT INTO `lit_sentence` VALUES (90, 'The thickness of solid - state electrolytes ( SSEs ) significantly affects the energy density and safety performance of all - solid - state lithium batteries .', '120');
INSERT INTO `lit_sentence` VALUES (91, 'When the energy landscape reached the saddle point , we surprisingly find that it corresponds not to any bottleneck but to Na2 site which indicate that Na2 site is a high energy site .', '132');
INSERT INTO `lit_sentence` VALUES (92, 'In our previous studies , we have developed a DFT - based protocol to predict the redox potential of organic electrode materials with high accuracy , in which the predicted redox potentials have uncertainties of round 0 . 2 V .', 'Molecular structure-redox potential relationship for organic electrode materials');
INSERT INTO `lit_sentence` VALUES (93, 'The multi - stage identification will not only improve in - depth analysis of degradation mechanisms but also may contribute to other related topics , such as state of health estimation .', 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation');
INSERT INTO `lit_sentence` VALUES (94, 'If we consider a battery model where the only parameter that is estimated is the open - circuit voltage ( Voc )', 'Lithium-Sulfur Battery State-of-Charge Observability Analysis and Estimation');
INSERT INTO `lit_sentence` VALUES (95, 'The transport in a straight line is referred to as an oxygen dumbbell hop ( ODH ) as the term was originally coined for oxides , and the transport through the tetrahedron is referred to as tetrahedron site hop ( TSH ) .', 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors');
INSERT INTO `lit_sentence` VALUES (96, 'Figure 14 presents the results of the IndRNN network model for SOH estimation under each time step size along with true SOH value obtained from battery dataset .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (97, 'These materials are typically synthesized using a high - energy ball - milling approach , which introduces a high degree of site disorder .', 'On-the-fly assessment of diffusion barriers of disordered transition metal oxyfluorides using local descriptors');
INSERT INTO `lit_sentence` VALUES (98, 'RF model flakes predictions using multiple decision trees that find the partition to which the new input belongs , choos - ing between subspaces with small variations .', 'Li-Ion Batteries Parameter Estimation With Tiny Neural Networks Embedded on Intelligent IoT Microcontrollers');
INSERT INTO `lit_sentence` VALUES (99, 'Iteratively perform cycling SSA method on the remaining cycling data . Based on the obtained stationary subspace , invariants in these cycles are obtained .', 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation');
INSERT INTO `lit_sentence` VALUES (100, 'To distinguish from the capacity loss in calendar storage , in this article , capacity fade only refers to the \" cycle life \" loss in battery discharge ability over time .', 'Invariant learning based multi-stage identification for Lithium-ion battery performance degradation');
INSERT INTO `lit_sentence` VALUES (101, 'In pseudo - 2D models , the DFN model is well - favoured in finite element electrodes are modelled by the framework of porous electrode theory which treats the electrodes as homogeneous multiphase system .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (102, 'Decision trees , also called Classification and Regression Tree ( CART ) , are statistical model firstly introduced in .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (103, 'The inductive effect is caused by the geometry of the cell and the porosity of the electrode plates of the cell .', 'Investigation of the performance of direct forecasting strategy using machine learning in State-of-Charge prediction of Li-ion batteries exposed to dynamic loads');
INSERT INTO `lit_sentence` VALUES (104, 'AlL - 18 input features extracted from three battery sets are provided as an input to the IndRNN network to establish the relationship with battery capacity .', 'State-of-Health Estimation of Li-ion Batteries in Electric Vehicle Using IndRNN under Variable Load Condition');
INSERT INTO `lit_sentence` VALUES (105, 'Latterly , numerous machine learning techniques have been devised for battery SoH estimation , such as artificial neural network ( ANN ) , support vector machine ( SVM ) , regressive vector machine ( RVM ) , particle filter ( PF ) , Random Forests ( RF ) and Gaussian process regression ( GPR ) .', 'State-of-health estimators coupled to a random forest approach for lithium-ion battery aging factor ranking');
INSERT INTO `lit_sentence` VALUES (106, 'It is demonstrated in the literature that battery \' s performance is a function of different factors such as SOC , state of health ( SOH ) , and temperature .', 'Lithium-Sulfur Battery State-of-Charge Observability Analysis and Estimation');

-- ----------------------------
-- Table structure for parameter_info
-- ----------------------------
DROP TABLE IF EXISTS `parameter_info`;
CREATE TABLE `parameter_info`  (
  `para_type_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型-英',
  `para_type_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型-中',
  `para_value` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `para_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数信息'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of parameter_info
-- ----------------------------

-- ----------------------------
-- Table structure for relation_input
-- ----------------------------
DROP TABLE IF EXISTS `relation_input`;
CREATE TABLE `relation_input`  (
  `doi` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sentence_id` int(255) NULL DEFAULT NULL,
  `relation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `labeled_sentence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `doi`(`doi`) USING BTREE,
  INDEX `sentence_id`(`sentence_id`) USING BTREE,
  CONSTRAINT `relation_input_ibfk_1` FOREIGN KEY (`doi`) REFERENCES `lit_sentence` (`doi`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `relation_input_ibfk_2` FOREIGN KEY (`sentence_id`) REFERENCES `lit_sentence` (`sentence_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relation_input
-- ----------------------------

-- ----------------------------
-- Table structure for relation_library
-- ----------------------------
DROP TABLE IF EXISTS `relation_library`;
CREATE TABLE `relation_library`  (
  `sentence_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `entity1_id` int(11) NULL DEFAULT NULL,
  `entity2_id` int(11) NULL DEFAULT NULL,
  `relation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relation_library
-- ----------------------------
INSERT INTO `relation_library` VALUES ('Due to the specific assignment of sigma = 0 for any Na / Si occupation, only clusters that are fully constituted by Va and / or by P contribute to non-zero ECIs to-wards the overall energy estimation in our CE model .', 1, 2, 'Used-For', 1);
INSERT INTO `relation_library` VALUES ('We removed selected structures, primarily at x = 0 and 0 . 25, whose high energies originate from the unfavourable ordering of Na in the structure while making the fitting of the CE extremely challenging .', 3, 4, 'Feature-Of', 2);
INSERT INTO `relation_library` VALUES ('Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 5, 6, 'Located-Of', 3);
INSERT INTO `relation_library` VALUES ('Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 7, 5, 'Property-Of', 4);
INSERT INTO `relation_library` VALUES ('Importantly, we find specific temperature and Na-concentration domains where the rhombohedral-NaSiCON exhibits a biphasic be-havior ( or phase separation ), which is similar to the behavior observed in NaSiCON-based elec-trodes .', 8, 5, 'Property-Of', 5);

-- ----------------------------
-- Table structure for spring_session
-- ----------------------------
DROP TABLE IF EXISTS `spring_session`;
CREATE TABLE `spring_session`  (
  `PRIMARY_ID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SESSION_ID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`) USING BTREE,
  UNIQUE INDEX `SPRING_SESSION_IX1`(`SESSION_ID`) USING BTREE,
  INDEX `SPRING_SESSION_IX2`(`EXPIRY_TIME`) USING BTREE,
  INDEX `SPRING_SESSION_IX3`(`PRINCIPAL_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spring_session
-- ----------------------------

-- ----------------------------
-- Table structure for spring_session_attributes
-- ----------------------------
DROP TABLE IF EXISTS `spring_session_attributes`;
CREATE TABLE `spring_session_attributes`  (
  `SESSION_PRIMARY_ID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`, `ATTRIBUTE_NAME`) USING BTREE,
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spring_session_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for sys_institution_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_institution_info`;
CREATE TABLE `sys_institution_info`  (
  `institution_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构编号',
  `institution_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `institution_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构详情',
  `institution_active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '0停1用'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_institution_info
-- ----------------------------
INSERT INTO `sys_institution_info` VALUES ('1', '上海大学', '学校', '1');
INSERT INTO `sys_institution_info` VALUES ('0', '开发机构', 'xxx', '1');

-- ----------------------------
-- Table structure for sys_log_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_info`;
CREATE TABLE `sys_log_info`  (
  `op_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `op_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `op_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作种类',
  `op_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `op_instatution_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作机构编号',
  `op_login_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人编号',
  `op_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求url'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log_info
-- ----------------------------
INSERT INTO `sys_log_info` VALUES ('2022-01-03 12:34:44', '11323124', 'user', '登录', '1', '222', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-01-03 12:34:44', '11323124', 'user', '获取目录信息', '1', '222', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-01-03 12:34:45', '11323124', 'user', '查看用户信息', '1', '222', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:25:57', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:25:57', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:25:57', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:26:02', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:26:04', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:26:13', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:26:22', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:26:26', 'yuziyi', 'user', '查询机构可访问目录数据', '0', '123', '/user/getInstitutionMenu');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:26:38', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:29:34', 'yuziyi', 'user', '查看机构管理员', '0', '123', '/user/institutionManagers');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:29:37', 'yuziyi', 'user', '查看机构管理员', '0', '123', '/user/institutionManagers');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:29:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:29:52', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:29:54', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:29:57', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:30:01', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:30:07', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:30:11', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:30:15', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:30:17', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:32:53', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:32:53', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:33:05', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:33:07', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:33:28', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:33:28', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:33:28', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:33:53', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:34:39', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:03', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:03', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:05', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:05', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:08', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:09', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:11', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:13', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:15', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:26', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:56', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:56', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:42:59', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:43:11', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:43:11', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:43:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:43:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:44:54', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 22:44:54', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 23:16:20', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 23:16:22', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-08 23:16:28', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:16', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:17', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:39', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:44', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:45', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:47', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:55', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:56', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:51:59', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:52:17', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:52:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:52:18', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:55:48', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:55:48', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:55:48', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:56:08', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 10:56:09', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:07', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:07', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:07', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:10', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:11', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:12', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:14', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-12 11:00:26', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:49:44', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:49:44', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:49:44', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:51:41', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:51:41', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:51:44', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:51:44', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:51:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:51:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:52:52', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:52:52', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:52:53', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:52:53', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:53:01', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:53:01', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:53:01', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:53:23', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:53:23', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:53:23', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:03', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:03', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:03', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:55', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:55', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:54:55', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:55:37', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:55:37', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 13:55:37', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:33:09', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:33:09', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:33:10', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:10', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:10', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:11', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:48', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:45:48', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:46:12', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:46:12', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:49:32', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:49:32', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:49:33', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:50:08', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:50:08', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:50:28', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:50:28', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:50:31', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:50:31', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:54:08', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:54:08', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:55:43', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-14 17:55:43', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:07:31', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:07:31', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:07:31', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:09:07', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:09:07', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:09:11', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:09:11', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:35:06', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:35:06', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:35:06', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:41:00', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:41:00', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:41:00', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:49:38', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:49:38', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:51:10', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:51:10', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:59:14', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 19:59:14', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:01:57', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:01:57', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:02:07', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:02:10', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:02:10', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:04:04', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:04:04', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:16:38', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:16:38', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:16:38', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:16:41', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:16:41', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:18:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:18:17', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:20:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:20:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:20:54', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:20:54', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:21:52', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:21:52', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:22:23', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:22:23', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:23:11', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:23:11', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:23:25', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:23:25', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:34:15', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:34:15', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:36:03', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:37:28', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:37:28', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:39:30', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:39:30', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:39:32', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:39:32', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:39:42', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:41:02', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:41:02', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:43:44', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:43:44', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:43:45', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:43:45', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:44:02', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:44:02', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:44:44', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:44:44', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:48:58', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:48:58', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:48:59', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:48:59', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:51:51', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:51:51', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:52:00', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 20:52:00', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 21:48:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 21:48:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 21:56:58', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 21:56:58', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 21:56:58', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:05:22', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:05:22', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:05:22', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:11:20', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:11:20', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:11:24', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:11:24', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:15:30', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:15:30', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:15:44', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:15:44', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:16:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:16:17', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:18:28', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:18:28', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:20:24', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:20:24', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:23:18', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:23:18', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:24:19', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:24:19', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:31:50', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:31:50', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:37:37', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:37:37', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:47:31', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:47:31', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:50:31', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:50:31', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:52:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:52:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:56:31', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-15 22:56:31', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 09:46:06', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 09:46:06', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 09:46:06', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 09:58:21', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 09:58:21', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:02:06', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:02:06', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:07:30', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:07:30', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:31:45', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:31:45', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:34:05', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:34:05', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:35:40', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:35:40', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:48:41', 'yuziyi', 'user', '登出', '0', '123', '/user/signOut');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:49:01', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:49:01', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:49:01', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:58:43', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:58:43', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:59:42', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 10:59:42', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 11:01:39', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 11:01:39', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 11:03:01', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 11:03:01', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 11:03:01', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 13:40:39', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 13:40:39', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 13:40:40', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-16 14:04:20', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2022-12-29 14:19:04', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2022-12-29 14:19:04', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2022-12-29 14:19:05', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:14:49', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:14:49', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:14:49', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:40:42', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:40:42', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:40:42', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:41:01', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:41:01', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:41:02', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:41:04', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:41:08', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:41:10', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:45:42', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:45:42', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:45:42', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:51:37', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-04 13:51:37', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:46:50', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:46:50', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:46:50', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:47:37', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:47:37', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:48:42', 'yuziyi', 'user', '登出', '0', '123', '/user/signOut');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:48:45', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:48:46', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:48:46', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:50:05', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:50:05', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:51:43', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:51:43', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:51:43', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:55:42', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:55:42', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 17:55:42', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 18:00:19', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 18:00:19', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 20:17:01', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 20:17:01', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 20:17:02', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:26:24', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:26:24', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:26:24', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:30:52', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:30:52', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:41:16', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:41:16', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:41:16', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:51:17', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:51:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 21:51:17', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:05:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:05:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:06:41', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:06:41', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:15:32', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:15:32', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:16:18', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:16:18', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:18:16', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:18:16', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:18:16', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:39:04', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:39:04', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:39:04', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:39:04', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:39:04', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:39:04', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:40:18', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:40:18', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:47:18', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:47:18', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:51:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-05 22:51:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-06 14:11:25', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-06 14:11:26', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-06 14:11:26', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:42:21', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:42:21', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:42:21', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:10', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:16', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:19', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:27', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:27', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:31', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:34', 'yuziyi', 'user', '查看用户操作日志', '0', '123', '/user/getOpLogInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:51', 'yuziyi', 'user', '查看菜单管理', '0', '123', '/user/getMenuManageData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:56', 'yuziyi', 'user', '查看操作功能信息', '0', '123', '/user/getOPInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 11:53:58', 'yuziyi', 'user', '查看机构信息', '0', '123', '/user/getInstitutionInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 12:28:38', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 12:28:38', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 12:42:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 12:42:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 12:50:42', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 12:50:42', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 13:08:34', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 13:08:34', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 14:36:01', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 14:36:01', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 14:36:01', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 14:37:51', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 14:37:51', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-13 14:37:51', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-26 11:03:48', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-26 11:03:48', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-26 11:03:48', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-26 11:06:30', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-26 11:06:30', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 19:53:11', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 19:53:12', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 19:53:12', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 19:53:29', 'yuziyi', 'user', '登出', '0', '123', '/user/signOut');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 20:56:44', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 20:56:44', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 20:56:44', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:02:34', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:02:35', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:02:35', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:07:02', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:07:02', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:07:02', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:09:53', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:09:53', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:11:37', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:11:37', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:12:02', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:12:02', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:13:16', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:13:16', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:15:56', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:15:56', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:15:57', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:28:21', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:28:21', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:28:22', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:56:47', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:56:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-27 22:56:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:47:53', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:47:53', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:47:53', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:51:49', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:51:49', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:51:49', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:54:07', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:54:07', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-01-28 12:54:07', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:37:49', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:37:49', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:37:49', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:40:49', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:40:49', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:40:49', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:43:17', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:43:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 15:43:17', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 16:30:47', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 16:30:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-01 16:30:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 16:59:10', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 16:59:10', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 16:59:10', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:11:47', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:11:47', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:14:57', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:14:57', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:14:57', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:15:17', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-02 19:15:17', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-03 11:02:55', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-03 11:02:55', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-03 11:02:55', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-10 14:05:33', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-10 14:05:33', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-10 14:05:33', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:19:55', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:19:56', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:19:56', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:20:18', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:20:18', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:58:13', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:58:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-22 22:58:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:46:28', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:46:28', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:46:28', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:48:28', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:48:28', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:59:12', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 10:59:12', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 12:36:13', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 12:36:13', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-02-24 12:36:13', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 10:18:32', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 10:18:32', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 10:18:32', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 10:25:33', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 10:25:33', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 10:25:34', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 11:18:19', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 11:18:19', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 20:45:54', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 20:45:54', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-16 20:45:54', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-23 13:49:14', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-23 13:49:14', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-23 13:49:14', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-23 14:31:10', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-23 14:31:10', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-23 14:31:10', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-28 19:51:12', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-28 19:51:12', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-28 19:51:12', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');
INSERT INTO `sys_log_info` VALUES ('2023-03-31 09:53:23', 'yuziyi', 'user', '登录', '0', '123', '/user/login');
INSERT INTO `sys_log_info` VALUES ('2023-03-31 09:53:23', 'yuziyi', 'user', '获取目录信息', '0', '123', '/user/getMenuData');
INSERT INTO `sys_log_info` VALUES ('2023-03-31 09:53:23', 'yuziyi', 'user', '查看用户信息', '0', '123', '/user/getUserInfo');

-- ----------------------------
-- Table structure for sys_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_info`;
CREATE TABLE `sys_menu_info`  (
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单编号',
  `menu_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单层级',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名',
  `menu_father_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `menu_active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1激活0停用',
  `menu_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu_info
-- ----------------------------
INSERT INTO `sys_menu_info` VALUES ('1', '1', '系统管理', '0', '1', '');
INSERT INTO `sys_menu_info` VALUES ('11', '2', '机构管理', '1', '1', '/institutionManage');
INSERT INTO `sys_menu_info` VALUES ('12', '2', '用户管理', '1', '1', '/userManage');
INSERT INTO `sys_menu_info` VALUES ('13', '2', '用户信息', '1', '1', '/userInfo');
INSERT INTO `sys_menu_info` VALUES ('14', '2', '系统日志', '1', '1', '/logInfo');
INSERT INTO `sys_menu_info` VALUES ('15', '2', '菜单管理', '1', '1', '/menuManage');
INSERT INTO `sys_menu_info` VALUES ('16', '2', '操作管理', '1', '1', '/opManage');
INSERT INTO `sys_menu_info` VALUES ('2', '1', '样例', '0', '1', '');
INSERT INTO `sys_menu_info` VALUES ('21', '2', '专利上传', '2', '1', '/addPatent');
INSERT INTO `sys_menu_info` VALUES ('22', '2', '专利列表', '2', '1', '/patentInfo');
INSERT INTO `sys_menu_info` VALUES ('3', '1', 'NASICON固态电解质', '0', '1', '');
INSERT INTO `sys_menu_info` VALUES ('23', '2', '实体抽取', '2', '1', '/entityExtract');
INSERT INTO `sys_menu_info` VALUES ('24', '2', '关系抽取', '2', '1', '/relationExtract');
INSERT INTO `sys_menu_info` VALUES ('25', '2', 'PlayField', '2', '1', '/playField');
INSERT INTO `sys_menu_info` VALUES ('26', '2', '子树构建', '2', '1', '/buildChildTree');
INSERT INTO `sys_menu_info` VALUES ('27', '2', '构建图', '2', '1', '/buildMap');

-- ----------------------------
-- Table structure for sys_op_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_op_info`;
CREATE TABLE `sys_op_info`  (
  `op_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作请求url',
  `op_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作分属模块、操作类型',
  `op_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作简述'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_op_info
-- ----------------------------
INSERT INTO `sys_op_info` VALUES ('/user/login', 'user', '登录');
INSERT INTO `sys_op_info` VALUES ('/user/getMenuData', 'user', '获取目录信息');
INSERT INTO `sys_op_info` VALUES ('/user/getUserInfo', 'user', '查看用户信息');
INSERT INTO `sys_op_info` VALUES ('/user/changeUserInfo', 'user', '更改用户信息');
INSERT INTO `sys_op_info` VALUES ('/user/resetPassword', 'user', '重置密码');
INSERT INTO `sys_op_info` VALUES ('/user/getInstitutionInfo', 'user', '查看机构信息');
INSERT INTO `sys_op_info` VALUES ('/user/institutionManagers', 'user', '查看机构管理员');
INSERT INTO `sys_op_info` VALUES ('/user/changeInstitutionDetail', 'user', '更改用户信息');
INSERT INTO `sys_op_info` VALUES ('/user/changeInstitutionStatus', 'user', '更改用户状态');
INSERT INTO `sys_op_info` VALUES ('/user/addNewInstitution', 'user', '新增机构');
INSERT INTO `sys_op_info` VALUES ('/user/changeUserStatus', 'user', '更改用户状态');
INSERT INTO `sys_op_info` VALUES ('/user/addNewManager', 'user', '新增机构管理员');
INSERT INTO `sys_op_info` VALUES ('/user/getOpLogInfo', 'user', '查看用户操作日志');
INSERT INTO `sys_op_info` VALUES ('/user/signOut', 'user', '登出');
INSERT INTO `sys_op_info` VALUES ('/user/getMenuManageData', 'user', '查看菜单管理');
INSERT INTO `sys_op_info` VALUES ('/user/addNewMenuMeb', 'user', '新增子菜单');
INSERT INTO `sys_op_info` VALUES ('/user/changeMenuStatus', 'user', '更改菜单状态');
INSERT INTO `sys_op_info` VALUES ('/user/getOPInfo', 'user', '查看操作功能信息');
INSERT INTO `sys_op_info` VALUES ('/user/addNewOP', 'user', '新增操作功能信息');
INSERT INTO `sys_op_info` VALUES ('/user/getInstitutionMenu', 'user', '查询机构可访问目录数据');
INSERT INTO `sys_op_info` VALUES ('/user/updateInstitutionMenu', 'user', '更新机构可访问目录数据');
INSERT INTO `sys_op_info` VALUES ('/user/getUserList', 'user', '查询机构普通用户列表');
INSERT INTO `sys_op_info` VALUES ('/user/addNewUser', 'user', '新增机构普通用户');
INSERT INTO `sys_op_info` VALUES ('/user/getUserMenu', 'user', '查询机构普通用户可访问目录');
INSERT INTO `sys_op_info` VALUES ('/user/updateUserMenu', 'user', '更新机构普通用户可访问目录');
INSERT INTO `sys_op_info` VALUES ('/user/addNewFMenuMeb', 'user', '新增一级菜单');

-- ----------------------------
-- Table structure for sys_puser_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_puser_menu`;
CREATE TABLE `sys_puser_menu`  (
  `login_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统一认证号',
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户菜单对照表\r\n机构普通用户可访问模块菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_puser_menu
-- ----------------------------
INSERT INTO `sys_puser_menu` VALUES ('111111', '1');
INSERT INTO `sys_puser_menu` VALUES ('111111', '13');
INSERT INTO `sys_puser_menu` VALUES ('111111', '14');

-- ----------------------------
-- Table structure for sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info`  (
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES ('1', '开发人员');
INSERT INTO `sys_role_info` VALUES ('2', '机构管理员');
INSERT INTO `sys_role_info` VALUES ('3', '机构普通用户');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色号',
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单号',
  `role_institution_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单对照表\r\n开发人员 可 机构管理-机构用户管理-可访问模块（即修改机构可用模块）\r\n机构管理人员 可 用户管理-可访问模块（即修改普通用户可访问模块）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '11', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '13', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '14', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '15', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '16', '0');
INSERT INTO `sys_role_menu` VALUES ('2', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '12', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '13', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '14', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '21', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '22', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '23', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '24', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '25', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '26', '0');
INSERT INTO `sys_role_menu` VALUES ('1', '27', '0');

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `login_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录认证号(唯一)',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色号',
  `user_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户信息',
  `user_institution_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属机构编号',
  `user_active` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1-激活，0-注销'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (NULL, '123', 'yuziyi', '698d51a19d8a121ce581499d7b701668', '1', '开发人员yzy！', '0', '1');
INSERT INTO `sys_user_info` VALUES (NULL, '111', '上海大学管理员', 'e10adc3949ba59abbe56e057f20f883e', '2', '', '1', '1');
INSERT INTO `sys_user_info` VALUES (NULL, '111111', '上大普通用户1', 'e10adc3949ba59abbe56e057f20f883e', '3', '', '1', '1');

SET FOREIGN_KEY_CHECKS = 1;
