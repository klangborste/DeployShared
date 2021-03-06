
/* ------------------------------------------------------------------------ */
/* Initialization                                                           */
/* ------------------------------------------------------------------------ */

SET QUOTED_IDENTIFIER ON 
GO

SET ANSI_NULLS OFF 
GO


/* ------------------------------------------------------------------------ */
/* Create setting tables and view                                           */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Settings]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Settings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Settings_Packages]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Settings_Packages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Settings_Applications]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Settings_Applications]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Settings_Administrators]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Settings_Administrators]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Settings_Roles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Settings_Roles]
GO

CREATE TABLE [dbo].[Settings]
(
	[Type] [char] (1) NOT NULL, 
	[ID] [int] NOT NULL,


	[UserID] [nvarchar] (255) NULL Default(''),
	[UserDomain] [nvarchar] (255) NULL Default(''),
	[UserPassword] [nvarchar] (255) NULL Default(''),
	[UDShare] [nvarchar] (255) NULL Default (''),
	[UDDir] [nvarchar] (255) NULL Default (''),
	[UDProfiles] [nvarchar] (255) NULL Default (''),
	[SLShare] [nvarchar] (255) NULL Default (''),
	[SLShareDynamicLogging] [nvarchar] (255) NULL Default (''),
	[EventShare] [nvarchar] (255) NULL Default (''),
	[OSInstall] [nvarchar] (50) NOT NULL Default ('YES'),
	[ComputerName] [nvarchar] (50) NULL Default (''),
	[OSDComputerName] [nvarchar] (50) NULL Default (''),
	[Home_Page] [nvarchar] (255) NULL Default(''),
	[JoinDomain] [nvarchar] (50) NULL Default (''),
	[JoinWorkGroup] [nvarchar] (50) NULL Default (''),
	[DomainAdmin] [nvarchar] (255) NULL Default(''),
	[DomainAdminDomain] [nvarchar] (255) NULL Default(''),
	[DomainAdminPassword] [nvarchar] (255) NULL Default(''),
	[MachineObjectOU] [nvarchar] (255) NULL Default (''),
	[ScanStateArgs] [nvarchar] (255) NULL Default(''),
	[LoadStateArgs] [nvarchar] (255) NULL Default(''),
	[ComputerBackupLocation] [nvarchar] (255) NULL Default(''),
	[BackupShare] [nvarchar] (255) NULL Default(''),
	[BackupDir] [nvarchar] (255) NULL Default(''),
	[UserDataLocation] [nvarchar] (255) NULL Default(''),
	[DoCapture] [nvarchar] (50) NULL Default(''),
	[ProductKey] [nvarchar] (255) NULL Default(''),
	[OverrideProductKey] [nvarchar] (255) NULL Default(''),
	[WDSServer] [nvarchar] (255) NULL Default(''),
	[CaptureGroups] [nvarchar] (255) NULL Default(''),
	[AdminPassword] [nvarchar] (255) NULL Default(''),
	[OrgName] [nvarchar] (255) NULL Default (''),
	[FullName] [nvarchar] (255) NULL Default (''),
	[TimeZone] [nvarchar] (50) NULL Default (''),
	[TimeZoneName] [nvarchar] (255) NULL Default (''),
	[TaskSequenceID] [nvarchar] (50) NULL Default(''),
	[KeyboardLocale] [nvarchar] (255) NULL Default(''),
	[InputLocale] [nvarchar] (255) NULL Default(''),
	[UserLocale] [nvarchar] (255) NULL Default(''),
	[SystemLocale] [nvarchar] (255) NULL Default(''),
	[UILanguage] [nvarchar] (255) NULL Default(''),
	[Xresolution] [nvarchar] (50) NULL Default(''),
	[Yresolution] [nvarchar] (50) NULL Default(''),
	[BitsPerPel] [nvarchar] (50) NULL Default(''),
	[Vrefresh] [nvarchar] (50) NULL Default(''),
	[AreaCode] [nvarchar] (50) NULL Default(''),
	[CountryCode] [nvarchar] (50) NULL Default(''),
	[LongDistanceAccess] [nvarchar] (50) NULL Default(''),
	[Dialing] [nvarchar] (50) NULL Default(''),
	[OSDBitlockerMode] [nvarchar] (50) NULL Default(''),
	[BdeInstallSuppress] [nvarchar] (50) NULL Default(''),
	[BdeInstall] [nvarchar] (50) NULL Default(''),
	[OSDBitLockerStartupKeyDrive] [nvarchar] (50) NULL Default(''),
	[OSDBitLockerCreateRecoveryPassword] [nvarchar] (50) NULL Default(''),
	[OSDBitLockerWaitForEncryption] [nvarchar] (50) NULL Default(''),
	[BDEWaitForEncryption] [nvarchar] (50) NULL Default(''),
	[BdeDriveLetter] [nvarchar] (50) NULL Default(''),
	[BdeDriveSize] [nvarchar] (50) NULL Default(''),
	[BdePin] [nvarchar] (50) NULL Default(''),
	[BdeRecoveryKey] [nvarchar] (50) NULL Default(''),
	[BdeKeyLocation] [nvarchar] (50) NULL Default(''),
	[TpmOwnerPassword] [nvarchar] (50) NULL Default(''),
	[OSDBitLockerRecoveryPassword] [nvarchar] (50) NULL Default(''),
	[OSDBitLockerStartupKey] [nvarchar] (50) NULL Default(''),
	[DriverGroup] [nvarchar] (255) NULL Default(''),
	[ServerA] [nvarchar] (255) NULL Default(''),
	[ServerB] [nvarchar] (255) NULL Default(''),
	[ServerC] [nvarchar] (255) NULL Default(''),
	[ResourceRoot] [nvarchar] (255) NULL Default(''),
	[FinishAction] [nvarchar] (255) NULL Default(''),
	[SMSTSRunCommandLineUserName] [nvarchar] (255) NULL Default(''),
	[SMSTSRunCommandLineUserPassword] [nvarchar] (255) NULL Default(''),
	
	[USMTConfigFile] [nvarchar] (255) NULL Default(''),
	[WipeDisk] [nvarchar] (50) NULL Default(''),
	[_SMSTSORGNAME] [nvarchar] (255) NULL Default(''),
	[WsusServer] [nvarchar] (255) NULL Default(''),
	[USMT3] [nvarchar] (50) NULL Default(''),
	[DriverSelectionProfile] [nvarchar] (255) NULL Default(''),
	[PackageSelectionProfile] [nvarchar] (255) NULL Default(''),
	[WizardSelectionProfile] [nvarchar] (255) NULL Default(''),
	[AutoMode] [nvarchar] (50) NULL Default(''),
	[AutoUsers] [nvarchar] (50) NULL Default(''),
	[ApplicationSuccessCodes] [nvarchar] (255) NULL Default(''),
	[BackupFile] [nvarchar] (255) NULL Default(''),

	[SkipWizard] [nvarchar] (50) NULL Default(''),
	[SkipCapture] [nvarchar] (50) NULL Default(''),
	[SkipAdminPassword] [nvarchar] (50) NULL Default(''),
	[SkipApplications] [nvarchar] (50) NULL Default(''),
	[SkipComputerBackup] [nvarchar] (50) NULL Default(''),
	[SkipDomainMembership] [nvarchar] (50) NULL Default(''),
	[SkipComputerName] [nvarchar] (50) NULL Default(''),
	[SkipUserData] [nvarchar] (50) NULL Default(''),
	[SkipPackageDisplay] [nvarchar] (50) NULL Default(''),
	[SkipLocaleSelection] [nvarchar] (50) NULL Default(''),
	[SkipProductKey] [nvarchar] (50) NULL Default(''),
	[SkipSummary] [nvarchar] (50) NULL Default(''),
	[SkipFinalSummary] [nvarchar] (50) NULL Default(''),
	[SkipBDDWelcome] [nvarchar] (50) NULL Default(''),
	[SkipTimeZone] [nvarchar] (50) NULL Default(''),
	[SkipTaskSequence] [nvarchar] (50) NULL Default(''),
	[SkipBitLocker] [nvarchar] (50) NULL Default(''),
	
	[DestinationDisk] [nvarchar] (50) NULL Default(''),
	[DestinationPartition] [nvarchar] (50) NULL Default(''),

	[OSDAdapterCount] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0Name] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0MacAddress] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0EnableDHCP] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0IPAddressList] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0SubnetMask] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0Gateways] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0GatewayCostMetric] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0DNSServerList] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0DNSSuffix] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0EnableDNSRegistration] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0EnableFullDNSRegistration] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0EnableLMHOSTS] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0EnableWINS] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0TcpipNetbiosOptions] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0WINSServerList] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0EnableTCPIPFiltering] [nvarchar] (50) NULL Default(''),
	[OSDAdapter0TCPFilterPortList] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0UDPFilterPortList] [nvarchar] (255) NULL Default(''),
	[OSDAdapter0IPProtocolFilterList] [nvarchar] (255) NULL Default(''),
	
	[OSDDiskIndex] [nvarchar] (50) NULL Default(''),
	[OSDPartitions] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0TYPE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0FILESYSTEM] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0BOOTABLE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0QUICKFORMAT] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0VOLUMENAME] [nvarchar] (255) NULL Default(''),
	[OSDPartitions0SIZE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0SIZEUNITS] [nvarchar] (50) NULL Default(''),
	[OSDPartitions0VOLUMELETTERVARIABLE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1TYPE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1FILESYSTEM] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1BOOTABLE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1QUICKFORMAT] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1VOLUMENAME] [nvarchar] (255) NULL Default(''),
	[OSDPartitions1SIZE] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1SIZEUNITS] [nvarchar] (50) NULL Default(''),
	[OSDPartitions1VOLUMELETTERVARIABLE] [nvarchar] (50) NULL Default(''),
	[DoNotCreateExtraPartition] [nvarchar] (50) NULL Default(''),
		
	[OSRoles] [nvarchar] (MAX) NULL Default(''),
	[OSRoleServices] [nvarchar] (MAX) NULL Default(''),
	[OSFeatures] [nvarchar] (MAX) NULL Default(''),
	
	[ReplicaOrNewDomain] [nvarchar] (50) NULL Default(''),
	[NewDomain] [nvarchar] (50) NULL Default(''),
	[NewDomainDNSName] [nvarchar] (255) NULL Default(''),
	[ParentDomainDNSName] [nvarchar] (255) NULL Default(''),
	[ReplicaDomainDNSName] [nvarchar] (255) NULL Default(''),
	[ChildName] [nvarchar] (255) NULL Default(''),
	[DomainNetBiosName] [nvarchar] (50) NULL Default(''),
	[ForestLevel] [nvarchar] (50) NULL Default(''),
	[DomainLevel] [nvarchar] (50) NULL Default(''),
	[AutoConfigDNS] [nvarchar] (50) NULL Default(''),
	[ConfirmGC] [nvarchar] (50) NULL Default(''),
	[CriticalReplicationOnly] [nvarchar] (50) NULL Default(''),
	[ADDSUserName] [nvarchar] (255) NULL Default(''),
	[ADDSUserDomain] [nvarchar] (255) NULL Default(''),
	[ADDSPassword] [nvarchar] (255) NULL Default(''),
	[ReplicationSourceDC] [nvarchar] (255) NULL Default(''),
	[DatabasePath] [nvarchar] (255) NULL Default(''),
	[ADDSLogPath] [nvarchar] (255) NULL Default(''),
	[SysVolPath] [nvarchar] (255) NULL Default(''),
	[SafeModeAdminPassword] [nvarchar] (255) NULL Default(''),
	[SiteName] [nvarchar] (255) NULL Default(''),
	
	[DHCPServerOptionRouter] [nvarchar] (255) NULL Default(''),
	[DHCPServerOptionDNSServer] [nvarchar] (255) NULL Default(''),
	[DHCPServerOptionWINSServer] [nvarchar] (255) NULL Default(''),
	[DHCPServerOptionDNSDomain] [nvarchar] (255) NULL Default(''),
	[DHCPServerOptionNBTNodeType] [nvarchar] (255) NULL Default(''),
	[DHCPServerOptionPXEClient] [nvarchar] (255) NULL Default(''),
	[DHCPScopes] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0SubnetMask] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0IP] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0Name] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0Description] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0StartIP] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0EndIP] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0ExcludeStartIP] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0ExcludeEndIP] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0OptionRouter] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0OptionDNSServer] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0OptionWINSServer] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0OptionDNSDomainName] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0OptionNBTNodeType] [nvarchar] (255) NULL Default(''),
	[DHCPScopes0OptionLease] [nvarchar] (50) NULL Default(''),
	[DHCPScopes0OptionPXEClient] [nvarchar] (50) NULL Default(''),
	
	[DNSZones] [nvarchar] (50) NULL Default(''),
	[DNSZones0Name] [nvarchar] (255) NULL Default(''),
	[DNSZones0Type] [nvarchar] (50) NULL Default(''),
	[DNSZones0MasterIP] [nvarchar] (50) NULL Default(''),
	[DNSZones0DirectoryPartition] [nvarchar] (255) NULL Default(''),
	[DNSZones0FileName] [nvarchar] (255) NULL Default(''),
	[DNSZones0Scavenge] [nvarchar] (50) NULL Default(''),
	[DNSZones0Update] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionDisableRecursion] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionBINDSecondaries] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionFailOnLoad] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionEnableRoundRobin] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionEnableNetmaskOrdering] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionEnableSecureCache] [nvarchar] (50) NULL Default(''),
	[DNSServerOptionNameCheckFlag] [nvarchar] (50) NULL Default(''),		
	
	[SMSTSPreferredAdvertID] [nvarchar] (50) NULL Default (''),
	[SMSTSUDAUsers] [nvarchar] (255) NULL Default (''),
	[SMSTSAssignUsersMode] [nvarchar] (50) NULL Default (''),
 	[OSDStateStorePath] [nvarchar] (255) NULL Default (''),
	CONSTRAINT [PK_Settings] PRIMARY KEY ([Type], [ID])
)
GO

CREATE TABLE [dbo].[Settings_Packages]
(
	[Type] [char] (1) NOT NULL, 
	[ID] [int] NOT NULL,
	[Sequence] [int] NOT NULL Default(0),

	[Packages] [nvarchar] (255) NULL,

	CONSTRAINT [PK_Settings_Packages] PRIMARY KEY ([Type], [ID], [Sequence])
)
GO

CREATE TABLE [dbo].[Settings_Applications]
(
	[Type] [char] (1) NOT NULL, 
	[ID] [int] NOT NULL,
	[Sequence] [int] NOT NULL Default(0),

	[Applications] [nvarchar] (256) NULL,

	CONSTRAINT [PK_Settings_Applications] PRIMARY KEY ([Type], [ID], [Sequence])
)
GO

CREATE TABLE [dbo].[Settings_Administrators]
(
	[Type] [char] (1) NOT NULL, 
	[ID] [int] NOT NULL,
	[Sequence] [int] NOT NULL Default(0),

	[Administrators] [nvarchar] (255) NULL,

	CONSTRAINT [PK_Settings_Administrators] PRIMARY KEY ([Type], [ID], [Sequence])
)
GO

CREATE TABLE [dbo].[Settings_Roles]
(
	[Type] [char] (1) NOT NULL, 
	[ID] [int] NOT NULL,
	[Sequence] [int] NOT NULL Default(0),

	[Role] [nvarchar] (255) NULL,

	CONSTRAINT [PK_Settings_Roles] PRIMARY KEY ([Type], [ID], [Sequence])
)
GO


/* ------------------------------------------------------------------------ */
/* Create computer identity tables and view                                 */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerSettings]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[ComputerSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerPackages]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[ComputerPackages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerApplications]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[ComputerApplications]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerAdministrators]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[ComputerAdministrators]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerRoles]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[ComputerRoles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerIdentityDelete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
DROP TRIGGER [dbo].[ComputerIdentityDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerIdentity_MacAddress]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ComputerIdentity_MacAddress]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ComputerIdentity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[ComputerIdentity]
GO

CREATE TABLE [dbo].[ComputerIdentity]
(
	[ID] [int] IDENTITY (1, 1) NOT NULL CONSTRAINT [PK_ComputerIdentity] PRIMARY KEY CLUSTERED,
	[Description] [nvarchar] (255) NULL,
	[AssetTag] [nvarchar] (255) NULL,
	[UUID] [nvarchar] (50) NULL,
	[SerialNumber] [nvarchar] (255) NULL,
	[MacAddress] [nvarchar] (50) NULL
)
GO

CREATE TRIGGER ComputerIdentityDelete
	ON [dbo].[ComputerIdentity]
	AFTER DELETE 
AS
	declare @id int
	SELECT @id = [ID] FROM deleted
	DELETE FROM [dbo].[Settings] WHERE [Type] = 'C' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Packages] WHERE [Type] = 'C' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Applications] WHERE [Type] = 'C' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Administrators] WHERE [Type] = 'C' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Roles] WHERE [Type] = 'C' AND [ID] = @id
GO

CREATE VIEW [dbo].[ComputerSettings] AS
SELECT ci.AssetTag, ci.UUID, ci.SerialNumber, ci.MacAddress, s.* FROM [dbo].[Settings] s
JOIN [dbo].[ComputerIdentity] ci
	ON s.[ID] = ci.[ID]
WHERE [Type] = 'C'
GO

CREATE VIEW [dbo].[ComputerPackages] AS
SELECT ci.AssetTag, ci.UUID, ci.SerialNumber, ci.MacAddress, s.* FROM [dbo].[Settings_Packages] s
JOIN [dbo].[ComputerIdentity] ci
	ON s.[ID] = ci.[ID]
WHERE [Type] = 'C'
GO

CREATE VIEW [dbo].[ComputerApplications] AS
SELECT ci.AssetTag, ci.UUID, ci.SerialNumber, ci.MacAddress, s.* FROM [dbo].[Settings_Applications] s
JOIN [dbo].[ComputerIdentity] ci
	ON s.[ID] = ci.[ID]
WHERE [Type] = 'C'
GO

CREATE VIEW [dbo].[ComputerAdministrators] AS
SELECT ci.AssetTag, ci.UUID, ci.SerialNumber, ci.MacAddress, s.* FROM [dbo].[Settings_Administrators] s
JOIN [dbo].[ComputerIdentity] ci
	ON s.[ID] = ci.[ID]
WHERE [Type] = 'C'
GO

CREATE VIEW [dbo].[ComputerRoles] AS
SELECT ci.AssetTag, ci.UUID, ci.SerialNumber, ci.MacAddress, s.* FROM [dbo].[Settings_Roles] s
JOIN [dbo].[ComputerIdentity] ci
	ON s.[ID] = ci.[ID]
WHERE [Type] = 'C'
GO


/* ------------------------------------------------------------------------ */
/* Create role identity table and view                                      */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleSettings]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[RoleSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RolePackages]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[RolePackages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleApplications]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[RoleApplications]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleAdministrators]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[RoleAdministrators]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleIdentityDelete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
DROP TRIGGER [dbo].[RoleIdentityDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleIdentity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RoleIdentity]
GO

CREATE TABLE [dbo].[RoleIdentity] (
	[ID] [int] IDENTITY (1, 1) NOT NULL CONSTRAINT [PK_RoleIdentity] PRIMARY KEY CLUSTERED,
	[Role] [nvarchar] (255) NULL
)
GO

CREATE TRIGGER RoleIdentityDelete
	ON [dbo].[RoleIdentity]
	AFTER DELETE 
AS
	declare @id int
	SELECT @id = [ID] FROM deleted
	DELETE FROM [dbo].[Settings] WHERE [Type] = 'R' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Packages] WHERE [Type] = 'R' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Applications] WHERE [Type] = 'R' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Administrators] WHERE [Type] = 'R' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Roles] WHERE [Type] = 'R' AND [ID] = @id
GO

CREATE VIEW [dbo].[RoleSettings] AS
SELECT ri.[Role], s.* FROM [dbo].[Settings] s
JOIN [dbo].[RoleIdentity] ri
	ON s.[ID] = ri.[ID]
WHERE [Type] = 'R'
GO

CREATE VIEW [dbo].[RolePackages] AS
SELECT ri.Role, s.* FROM [dbo].[Settings_Packages] s
JOIN [dbo].[RoleIdentity] ri
	ON s.[ID] = ri.[ID]
WHERE [Type] = 'R'
GO

CREATE VIEW [dbo].[RoleApplications] AS
SELECT ri.Role, s.* FROM [dbo].[Settings_Applications] s
JOIN [dbo].[RoleIdentity] ri
	ON s.[ID] = ri.[ID]
WHERE [Type] = 'R'
GO

CREATE VIEW [dbo].[RoleAdministrators] AS
SELECT ri.Role, s.* FROM [dbo].[Settings_Administrators] s
JOIN [dbo].[RoleIdentity] ri
	ON s.[ID] = ri.[ID]
WHERE [Type] = 'R'
GO

/* ------------------------------------------------------------------------ */
/* Create location identity table and view                                  */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Locations]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[Locations]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationSettings]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[LocationSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationPackages]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[LocationPackages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationApplications]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[LocationApplications]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationAdministrators]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[LocationAdministrators]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationRoles]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[LocationRoles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationIdentityDelete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
DROP TRIGGER [dbo].[LocationIdentityDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationIdentity_DefaultGateway]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LocationIdentity_DefaultGateway]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LocationIdentity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[LocationIdentity]
GO

CREATE TABLE [dbo].[LocationIdentity] (
	[ID] [int] IDENTITY (1, 1) NOT NULL CONSTRAINT [PK_LocationIdentity] PRIMARY KEY CLUSTERED,
	[Location] [nvarchar] (255) NULL
)
GO

CREATE TABLE [dbo].[LocationIdentity_DefaultGateway]
(
	[ID] [int] NOT NULL,
	[DefaultGateway] [nvarchar] (50) NOT NULL,
	CONSTRAINT [FK_LocationIdentity] FOREIGN KEY ([ID]) REFERENCES [LocationIdentity]([ID]) ON DELETE CASCADE,
	CONSTRAINT [PK_LocationIdentity_DefaultGateway] PRIMARY KEY ([ID], [DefaultGateway])
)
GO

CREATE TRIGGER LocationIdentityDelete
	ON [dbo].[LocationIdentity]
	AFTER DELETE 
AS
	declare @id int
	SELECT @id = [ID] FROM deleted
	DELETE FROM [dbo].[Settings] WHERE [Type] = 'L' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Packages] WHERE [Type] = 'L' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Applications] WHERE [Type] = 'L' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Administrators] WHERE [Type] = 'L' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Roles] WHERE [Type] = 'L' AND [ID] = @id
GO

CREATE VIEW [dbo].[Locations] AS
SELECT li.[Location], ld.[DefaultGateway] FROM [dbo].[LocationIdentity] li
JOIN [dbo].[LocationIdentity_DefaultGateway] ld
	ON li.[ID] = ld.[ID]
GO

CREATE VIEW [dbo].[LocationSettings] AS
SELECT li.[Location], ld.[DefaultGateway], s.* FROM [dbo].[Settings] s
JOIN [dbo].[LocationIdentity] li
	ON s.[ID] = li.[ID]
JOIN [dbo].[LocationIdentity_DefaultGateway] ld
	ON li.[ID] = ld.[ID]
WHERE [Type] = 'L'
GO

CREATE VIEW [dbo].[LocationPackages] AS
SELECT li.[Location], ld.[DefaultGateway], s.* FROM [dbo].[Settings_Packages] s
JOIN [dbo].[LocationIdentity] li
	ON s.[ID] = li.[ID]
JOIN [dbo].[LocationIdentity_DefaultGateway] ld
	ON li.[ID] = ld.[ID]
WHERE [Type] = 'L'
GO

CREATE VIEW [dbo].[LocationApplications] AS
SELECT li.[Location], ld.[DefaultGateway], s.* FROM [dbo].[Settings_Applications] s
JOIN [dbo].[LocationIdentity] li
	ON s.[ID] = li.[ID]
JOIN [dbo].[LocationIdentity_DefaultGateway] ld
	ON li.[ID] = ld.[ID]
WHERE [Type] = 'L'
GO

CREATE VIEW [dbo].[LocationAdministrators] AS
SELECT li.[Location], ld.[DefaultGateway], s.* FROM [dbo].[Settings_Administrators] s
JOIN [dbo].[LocationIdentity] li
	ON s.[ID] = li.[ID]
JOIN [dbo].[LocationIdentity_DefaultGateway] ld
	ON li.[ID] = ld.[ID]
WHERE [Type] = 'L'
GO

CREATE VIEW [dbo].[LocationRoles] AS
SELECT li.[Location], ld.[DefaultGateway], s.* FROM [dbo].[Settings_Roles] s
JOIN [dbo].[LocationIdentity] li
	ON s.[ID] = li.[ID]
JOIN [dbo].[LocationIdentity_DefaultGateway] ld
	ON li.[ID] = ld.[ID]
WHERE [Type] = 'L'
GO


/* ------------------------------------------------------------------------ */
/* Create make model identity table and view                                */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelSettings]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[MakeModelSettings]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelPackages]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[MakeModelPackages]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelApplications]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[MakeModelApplications]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelAdministrators]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[MakeModelAdministrators]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelRoles]') and OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[MakeModelRoles]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelIdentityDelete]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
DROP TRIGGER [dbo].[MakeModelIdentityDelete]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MakeModelIdentity]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[MakeModelIdentity]
GO

CREATE TABLE [dbo].[MakeModelIdentity] (
	[ID] [int] IDENTITY (1, 1) NOT NULL CONSTRAINT [PK_MakeModelIdentity] PRIMARY KEY CLUSTERED,
	[Make] [nvarchar] (255) NULL,
	[Model] [nvarchar] (255) NULL
)
GO

CREATE TRIGGER MakeModelIdentityDelete
	ON [dbo].[MakeModelIdentity]
	AFTER DELETE 
AS
	declare @id int
	SELECT @id = [ID] FROM deleted
	DELETE FROM [dbo].[Settings] WHERE [Type] = 'M' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Packages] WHERE [Type] = 'M' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Applications] WHERE [Type] = 'M' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Administrators] WHERE [Type] = 'M' AND [ID] = @id
	DELETE FROM [dbo].[Settings_Roles] WHERE [Type] = 'M' AND [ID] = @id
GO

CREATE VIEW [dbo].[MakeModelSettings] AS
SELECT mi.[Make], mi.[Model], s.* FROM [dbo].[Settings] s
JOIN [dbo].[MakeModelIdentity] mi
	ON s.[ID] = mi.[ID]
WHERE [Type] = 'M'
GO

CREATE VIEW [dbo].[MakeModelPackages] AS
SELECT mi.[Make], mi.[Model], s.* FROM [dbo].[Settings_Packages] s
JOIN [dbo].[MakeModelIdentity] mi
	ON s.[ID] = mi.[ID]
WHERE [Type] = 'M'
GO

CREATE VIEW [dbo].[MakeModelApplications] AS
SELECT mi.[Make], mi.[Model], s.* FROM [dbo].[Settings_Applications] s
JOIN [dbo].[MakeModelIdentity] mi
	ON s.[ID] = mi.[ID]
WHERE [Type] = 'M'
GO

CREATE VIEW [dbo].[MakeModelAdministrators] AS
SELECT mi.[Make], mi.[Model], s.* FROM [dbo].[Settings_Administrators] s
JOIN [dbo].[MakeModelIdentity] mi
	ON s.[ID] = mi.[ID]
WHERE [Type] = 'M'
GO

CREATE VIEW [dbo].[MakeModelRoles] AS
SELECT mi.[Make], mi.[Model], s.* FROM [dbo].[Settings_Roles] s
JOIN [dbo].[MakeModelIdentity] mi
	ON s.[ID] = mi.[ID]
WHERE [Type] = 'M'
GO


/* ------------------------------------------------------------------------ */
/* Package mapping                                                          */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PackageMapping]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[PackageMapping]
GO

CREATE TABLE [dbo].[PackageMapping] (
	[ARPName] [nvarchar] (255),
	[Packages] [nvarchar] (255)
)
GO



if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RetrievePackages]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[RetrievePackages]
GO

CREATE  PROCEDURE [dbo].[RetrievePackages]
@MacAddress CHAR(17)
AS

  SET NOCOUNT ON

  /* Select and return all the appropriate records based on current inventory */
  SELECT * FROM PackageMapping
  WHERE ARPName IN
  (
    SELECT ProdID0 FROM SMS_SMS.dbo.v_GS_ADD_REMOVE_PROGRAMS a, SMS_SMS.dbo.v_GS_NETWORK_ADAPTER n
    WHERE a.ResourceID = n.ResourceID AND
    MACAddress0 = @MacAddress
  )
GO


/* ------------------------------------------------------------------------ */
/* Legacy BDDAdminCore                                                      */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BDDAdminCore]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[BDDAdminCore]
GO

CREATE TABLE [dbo].[BDDAdminCore] (
	[ID] [int] IDENTITY (1, 1) NOT NULL CONSTRAINT [PK_BDDAdminCore] PRIMARY KEY,
	[ComputerName] [nvarchar] (50) DEFAULT (''),
	[MacAddress] [nvarchar] (50) DEFAULT (''),
	[AssetTag] [nvarchar] (255) DEFAULT (''),
	[SerialNumber] [nvarchar] (255) DEFAULT (''),
	[Make] [nvarchar] (255) DEFAULT (''),
	[Model] [nvarchar] (255) DEFAULT (''),
	[UDShare] [nvarchar] (255) DEFAULT (''),
	[UDDir] [nvarchar] (255) DEFAULT (''),
	[UDProfiles] [nvarchar] (255) DEFAULT (''),
	[SLShare] [nvarchar] (255) DEFAULT (''),
	[TimeZone] [nvarchar] (50) DEFAULT (''),
	[Admin] [nvarchar] (50) DEFAULT (''),
	[JoinDomain] [nvarchar] (50) DEFAULT (''),
	[MachineObjectOU] [nvarchar] (255) DEFAULT (''),
	[JoinWorkGroup] [nvarchar] (50) DEFAULT (''),
	[FullName] [nvarchar] (255) DEFAULT (''),
	[OrgName] [nvarchar] (255) DEFAULT (''),
	[Command0] [nvarchar] (255) DEFAULT (''),
	[OsdInstallSilent] [char] (1) DEFAULT ('1'),
	[OsdInstallPackage] [nvarchar] (255) DEFAULT (''),
	[OsdInstallProgram] [nvarchar] (255) DEFAULT (''),
	[OsdNewMachineName] [nvarchar] (255) DEFAULT (''),
	[OsdStatePath] [nvarchar] (255) DEFAULT (''),
	[OSInstall] [char] (1) DEFAULT ('Y'),
	[AdminUser] [nvarchar] (255) DEFAULT ('')
)
GO


/* ------------------------------------------------------------------------ */
/* Descriptions                                                     */
/* ------------------------------------------------------------------------ */

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Descriptions]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[Descriptions]
GO

CREATE TABLE [dbo].[Descriptions] (
	[ColumnName] [nvarchar] (255) NOT NULL CONSTRAINT [PK_Descriptions] PRIMARY KEY,
	[CategoryOrder] [int] DEFAULT (0),
	[Category] [nvarchar] (255) DEFAULT (''),
	[Description] [nvarchar] (255) DEFAULT ('')
)
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDComputerName', 1, 'Identification', 'The new computer name to assign to the computer.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ComputerName', 1, 'Identification', 'This variable has been deprecated and should only be used for backwards compatibility.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OrgName', 1, 'Identification', 'The organization name that should be assigned to the computer.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('FullName', 1, 'Identification', 'The full name that should be assigned to the computer.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('UDShare', 2, 'User Data', 'The UNC path where user data should be stored.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UDDir', 2, 'User Data', 'The directory that should be created to contain the user data.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UDProfiles', 2, 'User Data', 'A list of comma-separated usernames that should be captured.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ScanStateArgs', 2, 'User Data', 'Command line arguments for USMT Scanstate.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('LoadStateArgs', 2, 'User Data', 'Command line arguments for USMT Loadstate.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ComputerBackupLocation', 2, 'User Data', 'Specifies where the computer backup should be stored (AUTO, NETWORK, NONE, specific path, default is AUTO).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BackupShare', 2, 'User Data', 'Network share (UNC) where the computer backup should be stored.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BackupDir', 2, 'User Data', 'Directory on the network share where the computer backup should be stored.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BackupFile', 2, 'User Data', 'Sets the name of the backup file used with ztibackup')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserDataLocation', 2, 'User Data', 'Specifies where the user data should be stored (AUTO, NETWORK, NONE, specific path, default is AUTO).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('CaptureGroups', 2, 'User Data', 'Specifies whether to capture the local group membership from the machine (default is YES; ALL can also be specified).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('USMTConfigFile', 2, 'User Data', 'USMT configuration XML file that should be used when running Scanstate and Loadstate.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('USMT3', 2, 'User Data', 'Designates to always use USMT 3 Valid values are YES or NO.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDStateStorePath', 2, 'User Data', 'Full path to be used for state capture and state restore.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('JoinWorkgroup', 3, 'Domain and Workgroup', 'The name of the workgroup in which the computer should be placed.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('JoinDomain', 3, 'Domain and Workgroup', 'The name of the domain in which the computer should be placed.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainAdmin', 3, 'Domain and Workgroup', 'The name of the account used to join the domain.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainAdminDomain', 3, 'Domain and Workgroup', 'The domain of the account used to join the domain.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainAdminPassword', 3, 'Domain and Workgroup', 'The password of the account used to join the domain.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('MachineObjectOU', 3, 'Domain and Workgroup', 'The OU in which the computer account should be created (if it does not already exist).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('TimeZone', 4, 'Regional and Locale Settings', 'The time zone identifier that should be used for the computer (XP only).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('TimeZoneName', 4, 'Regional and Locale Settings', 'The time zone name that should be used for the computer (Vista only).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('KeyboardLocale', 4, 'Regional and Locale Settings', 'Locale used for Keyboard, can be either 0409:00000409 or en-US format (Vista only, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('InputLocale', 4, 'Regional and Locale Settings', 'Locale used for keyboard, e.g. 0409:00000409 (XP only, default is OS default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserLocale', 4, 'Regional and Locale Settings', 'Locale used for Keyboard, can be either 0409:00000409 or en-US format (default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SystemLocale', 4, 'Regional and Locale Settings', 'Locale used for System (default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UILanguage', 4, 'Regional and Locale Settings', 'Default language used for OS before user is logged in, en-US format (default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AreaCode', 4, 'Regional and Locale Settings', 'Area code for the computers location.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('CountryCode', 4, 'Regional and Locale Settings', 'Country or region code to use for telephony.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('LongDistanceAccess', 4, 'Regional and Locale Settings', 'Number to dial to gain access to an outside line, such as 9.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Dialing', 4, 'Regional and Locale Settings', 'Type of dialing to use for the telephony device in the computer, such as Tone or Pulse (XP only).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('Xresolution', 5, 'Display Settings', 'The horizontal resolution of the screen (example: 1024, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Yresolution', 5, 'Display Settings', 'The vertical resolution of the screen (example: 768, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BitsPerPel', 5, 'Display Settings', 'The color depth of the screen in bits per pixel (example: 32, default is OS Default).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Vrefresh', 5, 'Display Settings', 'The vertical refresh rate of the monitor in Hz (example: 60, default is OS Default).')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('BdeInstall', 6, 'BitLocker', 'Specifies the type of BDE install. (ProtectKeyWithTpm, ProtectKeyWithTpmAndPin, ProtectKeyWithTpmAndStartupKey, ProtectKeyWithExternalKey)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeDriveLetter', 6, 'BitLocker', 'Drive Letter for BDE partition (default S:).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeDriveSize', 6, 'BitLocker', 'Drive size for BDE partition in MB (default 2048MB).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdePin', 6, 'BitLocker', 'Specifies the startup Pin for BDE (only valid with ProtectKeyWithTpmAndPin).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeRecoveryKey', 6, 'BitLocker', 'Boolean (any value) creates a recovery key.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeKeyLocation', 6, 'BitLocker', 'Specifies the location of Key files (Fully qualified path or REMOVABLEDRIVE).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitlockerMode', 6, 'BitLocker', 'Specifies the type of BDE install. (KEY|TPMKey|TPMPin|TPM).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BDEInstallSuppress', 6, 'BitLocker', 'Value to indicate whether a BDE Install should be attempted. (YES or NO)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerTargetDrive', 6, 'BitLocker', 'Specifies the drive to be encrypted (default OS Drive)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerStartupKeyDrive', 6, 'BitLocker', 'Specifies the location of Key files (Drive)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerCreateRecoveryPassword', 6, 'BitLocker', 'Indicates whether a recovery password should be generated for AD.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerWaitForEncryption', 6, 'BitLocker', 'Boolean (any value) indicated whether process should be held to wait for drive encryption to complete.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('BdeWaitForEncryption', 6, 'BitLocker', '(Deprecated) Boolean (any value) indicated whether process should be held to wait for drive encryption to complete.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('TpmOwnerPassword', 6, 'BitLocker', 'Specifies the TPM Password for setting ownership.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerRecoveryPassword', 6, 'BitLocker', 'Specifies the password to use for BDE Password scenarios')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDBitLockerStartupKey', 6, 'BitLocker', 'Specifies the value to use for startup key.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('SkipWizard', 7, 'Wizard Control', 'Skip wizard')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipCapture', 7, 'Wizard Control', 'Skip capture')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipAdminPassword', 7, 'Wizard Control', 'Skip admin password')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipApplications', 7, 'Wizard Control', 'Skip applications')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipComputerBackup', 7, 'Wizard Control', 'Skip computer backup')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipDomainMembership', 7, 'Wizard Control', 'Skip domain membership')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipComputerName', 7, 'Wizard Control', 'Skip computer name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipUserData', 7, 'Wizard Control', 'Skip user data')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipPackageDisplay', 7, 'Wizard Control', 'Skip package display')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipLocaleSelection', 7, 'Wizard Control', 'Skip locale selection')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipProductKey', 7, 'Wizard Control', 'Skip product key')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipSummary', 7, 'Wizard Control', 'Skip summary pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipFinalSummary', 7, 'Wizard Control', 'Skip the final summary pane presented at the end of a Lite Touch deployment (default is NO)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipBDDWelcome', 7, 'Wizard Control', 'Skip the Lite Touch welcome screen shown when booting from a Lite Touch Windows PE image (default is NO)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipTimeZone', 7, 'Wizard Control', 'Skip the time zone pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipTaskSequence', 7, 'Wizard Control', 'Skip the task sequence pane (requires that TaskSequenceID be set)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SkipBitLocker', 7, 'Wizard Control', 'Skip the BitLocker pane')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserID', 8, 'Miscellaneous', 'The user ID to be used to make network connections.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserPassword', 8, 'Miscellaneous', 'The password to be used to make network connections.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('UserDomain', 8, 'Miscellaneous', 'The domain to be used to make network connections.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SLShare', 8, 'Miscellaneous', 'The UNC path where logs should be copied.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SLShareDynamicLogging', 8, 'Miscellaneous', 'Script log share where all MDT events should be written during execution (advanced debugging only)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('EventShare', 8, 'Miscellaneous', 'The UNC path where events for the management pack should be placed.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSInstall', 8, 'Miscellaneous', 'A flag to indicate that a new OS can be deployed to this computer, set to Y to authorize.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('Home_Page', 8, 'Miscellaneous', 'Internet Explorer home page.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DoCapture', 8, 'Miscellaneous', 'Flag to indicate that the machine should be Sysprepped and captured as a new WIM image (default is NO).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ProductKey', 8, 'Miscellaneous', 'Product key (non-MAK key).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OverrideProductKey', 8, 'Miscellaneous', 'Override product key (MAK key).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WDSServer', 8, 'Miscellaneous', 'Name of the WDS server that should be used when installing WDS images (default is the server that contains the original image).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AdminPassword', 8, 'Miscellaneous', 'Local Administrator password')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('TaskSequenceID', 8, 'Miscellaneous', 'TaskSequence ID used to automate LTI task sequence selection (default is blank)')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DriverGroup', 8, 'Miscellaneous', 'Specifies the name of the driver group from which drivers should be injected')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DriverSelectionProfile', 8, 'Miscellaneous', 'Profile name used during driver installation.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('PackageSelectionProfile', 8, 'Miscellaneous', 'Profile name used during Package installation.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WizardSelectionProfile', 8, 'Miscellaneous','Profile name used by the wizard for filtering the display of various items.')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('ServerA', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ServerB', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ServerC', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ResourceRoot', 8, 'Miscellaneous', 'Specifies the name of a server to be used during the deployment process for resources like drivers, language packs, and hotfixes.  (This should be set for ZTI only.)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ApplicationSuccessCodes', 8, 'Miscellaneous', 'Space delimited list of error codes allowed by ZTIApplications.wsf (default: 0 3010)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('_SMSTSORGNAME', 8, 'Miscellaneous', 'Customizes the Task Sequencer engine display banner.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WsusServer', 8, 'Miscellaneous', 'The URL of the WSUS server that should be used (optional, will use Windows Update or policy settings by default)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('WipeDisk', 8, 'Miscellaneous', 'Specifies whether the disk should be wiped. (Replace Only)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('FinishAction', 8, 'Miscellaneous', 'Specifies what action should be taken when a Lite Touch task sequence completes (SHUTDOWN, REBOOT, LOGOFF, or default of none)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSRunCommandLineUserName', 8, 'Miscellaneous', 'Specifies the username (e.g. DOM\USER) that should be used with a Run Command Line action that is configure to run as user')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSRunCommandLineUserPassword', 8, 'Miscellaneous', 'Specifies the password that should be used with a Run Command Line action that is configure to run as user')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapterCount', 10, 'NIC Settings', 'Number of Adapters defined here( either blank, 0 or 1)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0Name', 10, 'NIC Settings', 'If present, match all settings to the adapter with this name.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0MacAddress', 10, 'NIC Settings', 'If present, match all settings to the adapter with this MAC address.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableDHCP', 10, 'NIC Settings', 'If false, will disable DHCP, otherwise True (true if blank).')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0IPAddressList', 10, 'NIC Settings', 'Comma delimited list of IPAddress Lists')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0SubnetMask', 10, 'NIC Settings', 'Comma delimited list of Subnet masks')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0Gateways', 10, 'NIC Settings', 'Comma delimited list of Gateway cost metrics')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0GatewayCostMetric', 10, 'NIC Settings', 'Comma delimited list of Gateway Cost Metrics as either integers, or the string Automatic (if empty, uses automatic)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0DNSServerList', 10, 'NIC Settings', 'Comma delimited list of DNS Servers')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0DNSSuffix', 10, 'NIC Settings', 'DNS Suffix, example Frabrikam.com')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableDNSRegistration', 10, 'NIC Settings', 'True/False to enable DNS registration.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableFullDNSRegistration', 10, 'NIC Settings', 'True/False to enable FULL DNS registration.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableLMHOSTS', 10, 'NIC Settings', 'True/False to enable LMHosts')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableWINS', 10, 'NIC Settings', 'True/False to enable WINS')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0TcpipNetbiosOptions', 10, 'NIC Settings', 'NetBIOS OPtions 1 or 0')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0WINSServerList', 10, 'NIC Settings', 'Comma delimited list of WINS Servers')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0EnableTCPIPFiltering', 10, 'NIC Settings', 'True/False to enable TCP/IP Filtering.')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0TCPFilterPortList', 10, 'NIC Settings', 'Comma delimited list of TCP Filters')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0UDPFilterPortList', 10, 'NIC Settings', 'Comma delimited list of UDP Filters')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDAdapter0IPProtocolFilterList', 10, 'NIC Settings', 'Comma delimited list of IP Protocol FIlters')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSDDiskIndex', 11, 'Disk Settings', 'Disk index used for Partitioning (Default is 0)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions', 11, 'Disk Settings', 'Number of Partitions listed here (Default is None, max of 2, use Default configuration)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0TYPE', 11, 'Disk Settings', 'Type of partition (Default: Primary, can be Logical or extended)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0FILESYSTEM', 11, 'Disk Settings', 'Type of File System (Default: NTFS, can be FAT32)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0BOOTABLE', 11, 'Disk Settings', 'True/False - Is the partition bootalbe')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0QUICKFORMAT', 11, 'Disk Settings', 'True/False - Shall the format be quick (default: True)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0VOLUMENAME', 11, 'Disk Settings', 'Volume name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0SIZE', 11, 'Disk Settings', 'Size of partition')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0SIZEUNITS', 11, 'Disk Settings', 'Size units of partition (default: MB, can be GB or percentage )')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions0VOLUMELETTERVARIABLE', 11, 'Disk Settings', 'Variable Name to receive DriveLetter')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1TYPE', 11, 'Disk Settings', 'Type of partition (Default: Primary, can be Logical or extended)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1FILESYSTEM', 11, 'Disk Settings', 'Type of File System (Default: NTFS, can be FAT32)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1BOOTABLE', 11, 'Disk Settings', 'True/False - Is the partition bootalbe (default: True if 1st partition)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1QUICKFORMAT', 11, 'Disk Settings', 'True/False - Shall the format be quick (default: True)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1VOLUMENAME', 11, 'Disk Settings', 'Volume name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1SIZE', 11, 'Disk Settings', 'Size of partition')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1SIZEUNITS', 11, 'Disk Settings','Size units of partition (default: MB, can be GB or percentage)')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSDPartitions1VOLUMELETTERVARIABLE', 11, 'Disk Settings', 'Variable Name to receive DriveLetter')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DoNotCreateExtraPartition', 11, 'Disk Settings', 'Specifies that Windows 7 and Windows Server 2008R2 will not create the 300 MB system partition')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('OSRoles', 12, 'OS Roles', 'Comma-delimited list of role IDs to be installed')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSRoleService', 12, 'OS Roles', 'Comma-delimited list of role service IDs to be installed')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('OSFeatures', 12, 'OS Roles', 'Comma-delimited list of features to be installed')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AutoMode', 12, 'OS Roles', 'Sets AutoMode for Server 2003 deployments')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AutoUsers', 12, 'OS Roles', 'Sets AutoUsers for Server 2003 deployments')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('ReplicaOrNewDomain', 13, 'ADDS Settings', 'Chooses whether the domain controller will be a replica or part of a new domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('NewDomain', 13, 'ADDS Settings', 'Choice between a new forest or new domain in an existing tree or a new domain in a new tree')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('NewDomainDNSName', 13, 'ADDS Settings', 'DNS domain name of new domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ParentDomainDNSName', 13, 'ADDS Settings', 'Parent DNS domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ReplicaDomainDNSName', 13, 'ADDS Settings', 'Replica DNS domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ChildName', 13, 'ADDS Settings', 'Name of child domain')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainNetBiosName', 13, 'ADDS Settings', 'NetBios Name')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ForestLevel', 13, 'ADDS Settings', 'Forest Level')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DomainLevel', 13, 'ADDS Settings', 'Domain functional level')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('AutoConfigDNS', 13, 'ADDS Settings', 'Chooses to auto configure DNS')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ConfirmGC', 13, 'ADDS Settings', 'Chooses whether to Confirm communication to GC')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('CriticalReplicationOnly', 13, 'ADDS Settings', 'Chooses to only replicate critical information')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSUserName', 13, 'ADDS Settings', 'Username chosen to run dcpromo')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSUserDomain', 13, 'ADDS Settings', 'Domain for user chosen to run dcpromo')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSPassword', 13, 'ADDS Settings', 'Password for user chosen to run dcpromo')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ReplicationSourceDC', 13, 'ADDS Settings', 'DC used to replicate content')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DatabasePath', 13, 'ADDS Settings', 'Path to store the AD database')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('ADDSLogPath', 13, 'ADDS Settings', 'Path to store the AD database logs')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SysVolPath', 13, 'ADDS Settings', 'Path to store the SYSVOL')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SafeModeAdminPassword', 13, 'ADDS Settings', 'Password used for safemode recovery')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SiteName', 13, 'ADDS Settings', 'AD SiteName')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionRouter', 14, 'DHCP Server Settings', 'Routers for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionDNSServer', 14, 'DHCP Server Settings', 'DNS Server for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionWINSServer', 14, 'DHCP Server Settings', 'WINS Server for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionDNSDomain', 14, 'DHCP Server Settings', 'DNS domain for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionNBTNodeType', 14, 'DHCP Server Settings', 'NBT NodeType for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPServerOptionPXEClient', 14, 'DHCP Server Settings', 'PXE Client option for the DHCP Server Option')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes', 14, 'DHCP Server Settings', 'Number of DHCP Scopes to Configure')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0SubnetMask', 14, 'DHCP Server Settings', 'Subnet mask for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0IP', 14, 'DHCP Server Settings', 'IP Subnet for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0Name', 14, 'DHCP Server Settings', 'Name for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0Description', 14, 'DHCP Server Settings', 'Description for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0StartIP', 14, 'DHCP Server Settings', 'Starting IP address the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0EndIP', 14, 'DHCP Server Settings', 'Ending IP for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0ExcludeStartIP', 14, 'DHCP Server Settings', 'Start of the excluding IP range for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0ExcludeEndIP', 14, 'DHCP Server Settings', 'End of the excluding IP range for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionRouter', 14, 'DHCP Server Settings', 'Router of the excluding IP range for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionDNSServer', 14, 'DHCP Server Settings', 'DNS Server for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionWINSServer', 14, 'DHCP Server Settings', 'WINS Server for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionDNSDomainName', 14, 'DHCP Server Settings', 'DNS Domain Name for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionNBTNodeType', 14, 'DHCP Server Settings', 'NBT Node Type for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionLease', 14, 'DHCP Server Settings', 'Lease Duration for the first DHCP Scope')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DHCPScopes0OptionPXEClient', 14, 'DHCP Server Settings', 'PXE Client for the first DHCP Scope')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones', 15, 'DNS Server Settings', 'Number of DNS Zones to Configure')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Name', 15, 'DNS Server Settings', 'Name of the first DNS Zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Type', 15, 'DNS Server Settings', 'Type of Zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0MasterIP', 15, 'DNS Server Settings', 'Primary IP for the zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0DirectoryPartition', 15, 'DNS Server Settings', 'AD Partition to store the zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0FileName', 15, 'DNS Server Settings', 'File Name of the first DNS Zone')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Scavenge', 15, 'DNS Server Settings', 'Enables scavenging')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSZones0Update', 15, 'DNS Server Settings', 'Enables dynamic updates')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionDisableRecursion', 15, 'DNS Server Settings', 'Disables recursion on the DNS server')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionBINDSecondaries', 15, 'DNS Server Settings', 'Allows BIND secondaries')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionFailOnLoad', 15, 'DNS Server Settings', 'Toggles fail on load')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionEnableRoundRobin', 15, 'DNS Server Settings', 'Enables Round Robin')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionEnableNetmaskOrdering', 15, 'DNS Server Settings', 'Enables netmask ordering')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionEnableSecureCache', 15, 'DNS Server Settings', 'Enables cache security')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('DNSServerOptionNameCheckFlag', 15, 'DNS Server Settings', 'Name Check Flag')
GO

INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSPreferredAdvertID', 16, 'ConfigMgr 2012 OSD', 'Preferred task sequence advertisement ID')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSUDAUsers', 16, 'ConfigMgr 2012 OSD', 'Comma-delimeted list of primary users for the computer')
GO
INSERT INTO [dbo].[Descriptions] VALUES ('SMSTSAssignUsersMode', 16, 'ConfigMgr 2012 OSD', 'Specifies if users can change the primary users for the computer (AUTO, PENDING, DISABLED)')
GO
