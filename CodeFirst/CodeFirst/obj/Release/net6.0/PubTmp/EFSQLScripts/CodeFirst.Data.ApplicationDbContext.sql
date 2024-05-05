IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916025554_InitialDatabaseSetup')
BEGIN
    CREATE TABLE [Employee] (
        [Id] int NOT NULL IDENTITY,
        [FirstName] nvarchar(max) NOT NULL,
        [LastName] nvarchar(max) NOT NULL,
        [Mobile] nvarchar(max) NOT NULL,
        [Email] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Employee] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916025554_InitialDatabaseSetup')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230916025554_InitialDatabaseSetup', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916032941_IdentityTables')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230916032941_IdentityTables', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916040113_AddNewInforUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Discriminator] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916040113_AddNewInforUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [FirstName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916040113_AddNewInforUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [LastName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230916040113_AddNewInforUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230916040113_AddNewInforUser', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230917081630_updateEmpployee')
BEGIN
    ALTER TABLE [Employee] ADD [Address] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230917081630_updateEmpployee')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230917081630_updateEmpployee', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230917182910_addAvatarUser')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Menu]') AND [c].[name] = N'ImageUrl');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Menu] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Menu] ALTER COLUMN [ImageUrl] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230917182910_addAvatarUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Avatar] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230917182910_addAvatarUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230917182910_addAvatarUser', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230918153322_addBranch')
BEGIN
    CREATE TABLE [Branch] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Branch] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230918153322_addBranch')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230918153322_addBranch', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230918153546_addAvatarEmployee')
BEGIN
    ALTER TABLE [Employee] ADD [Avatar] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230918153546_addAvatarEmployee')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230918153546_addAvatarEmployee', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230918154111_upBranch')
BEGIN
    ALTER TABLE [Branch] ADD [Description] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230918154111_upBranch')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230918154111_upBranch', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012557_initServiceCategories')
BEGIN
    CREATE TABLE [ServiceCategory] (
        [CategoryId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        CONSTRAINT [PK_ServiceCategory] PRIMARY KEY ([CategoryId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012557_initServiceCategories')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230919012557_initServiceCategories', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012737_initServiceEntity')
BEGIN
    CREATE TABLE [ServiceEntity] (
        [ServiceId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [CategoryId] int NOT NULL,
        CONSTRAINT [PK_ServiceEntity] PRIMARY KEY ([ServiceId]),
        CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [ServiceCategory] ([CategoryId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012737_initServiceEntity')
BEGIN
    CREATE INDEX [IX_ServiceEntity_CategoryId] ON [ServiceEntity] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012737_initServiceEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230919012737_initServiceEntity', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012857_updateNotNullServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] DROP CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012857_updateNotNullServiceEntity')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceEntity]') AND [c].[name] = N'CategoryId');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [ServiceEntity] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [ServiceEntity] ALTER COLUMN [CategoryId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012857_updateNotNullServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] ADD CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [ServiceCategory] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919012857_updateNotNullServiceEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230919012857_updateNotNullServiceEntity', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919013348_updatePriceDescriptionServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] ADD [Description] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919013348_updatePriceDescriptionServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] ADD [Price] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919013348_updatePriceDescriptionServiceEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230919013348_updatePriceDescriptionServiceEntity', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919014145_updateFkNullServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] DROP CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919014145_updateFkNullServiceEntity')
BEGIN
    DROP INDEX [IX_ServiceEntity_CategoryId] ON [ServiceEntity];
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ServiceEntity]') AND [c].[name] = N'CategoryId');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [ServiceEntity] DROP CONSTRAINT [' + @var2 + '];');
    EXEC(N'UPDATE [ServiceEntity] SET [CategoryId] = 0 WHERE [CategoryId] IS NULL');
    ALTER TABLE [ServiceEntity] ALTER COLUMN [CategoryId] int NOT NULL;
    ALTER TABLE [ServiceEntity] ADD DEFAULT 0 FOR [CategoryId];
    CREATE INDEX [IX_ServiceEntity_CategoryId] ON [ServiceEntity] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919014145_updateFkNullServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] ADD CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [ServiceCategory] ([CategoryId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919014145_updateFkNullServiceEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230919014145_updateFkNullServiceEntity', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230919014638_updateService')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230919014638_updateService', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230922135930_addTableMenuCategory')
BEGIN
    CREATE TABLE [MenuCategory] (
        [CategoryId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        CONSTRAINT [PK_MenuCategory] PRIMARY KEY ([CategoryId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230922135930_addTableMenuCategory')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230922135930_addTableMenuCategory', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230922140039_addTableMenu')
BEGIN
    CREATE TABLE [MenuEntity] (
        [MenuId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Price] float NULL,
        [Description] nvarchar(max) NULL,
        [CategoryId] int NOT NULL,
        CONSTRAINT [PK_MenuEntity] PRIMARY KEY ([MenuId]),
        CONSTRAINT [FK_MenuEntity_MenuCategory_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [MenuCategory] ([CategoryId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230922140039_addTableMenu')
BEGIN
    CREATE INDEX [IX_MenuEntity_CategoryId] ON [MenuEntity] ([CategoryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230922140039_addTableMenu')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230922140039_addTableMenu', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230926033853_imgTableMenu')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MenuEntity]') AND [c].[name] = N'Price');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [MenuEntity] DROP CONSTRAINT [' + @var3 + '];');
    EXEC(N'UPDATE [MenuEntity] SET [Price] = 0.0E0 WHERE [Price] IS NULL');
    ALTER TABLE [MenuEntity] ALTER COLUMN [Price] float NOT NULL;
    ALTER TABLE [MenuEntity] ADD DEFAULT 0.0E0 FOR [Price];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230926033853_imgTableMenu')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MenuEntity]') AND [c].[name] = N'Name');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [MenuEntity] DROP CONSTRAINT [' + @var4 + '];');
    EXEC(N'UPDATE [MenuEntity] SET [Name] = N'''' WHERE [Name] IS NULL');
    ALTER TABLE [MenuEntity] ALTER COLUMN [Name] nvarchar(max) NOT NULL;
    ALTER TABLE [MenuEntity] ADD DEFAULT N'' FOR [Name];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230926033853_imgTableMenu')
BEGIN
    ALTER TABLE [MenuEntity] ADD [Image] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230926033853_imgTableMenu')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230926033853_imgTableMenu', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005054412_initTableInvoice')
BEGIN
    CREATE TABLE [Invoice] (
        [InvoiceID] int NOT NULL IDENTITY,
        [UserId] int NULL,
        CONSTRAINT [PK_Invoice] PRIMARY KEY ([InvoiceID])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005054412_initTableInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231005054412_initTableInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005054744_initTableOrderMenu')
BEGIN
    CREATE TABLE [OrderMenu] (
        [OrderMenuId] int NOT NULL IDENTITY,
        [InvoiceID] int NULL,
        [MenuId] int NULL,
        CONSTRAINT [PK_OrderMenu] PRIMARY KEY ([OrderMenuId]),
        CONSTRAINT [FK_OrderMenu_Invoice_InvoiceID] FOREIGN KEY ([InvoiceID]) REFERENCES [Invoice] ([InvoiceID]),
        CONSTRAINT [FK_OrderMenu_MenuEntity_MenuId] FOREIGN KEY ([MenuId]) REFERENCES [MenuEntity] ([MenuId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005054744_initTableOrderMenu')
BEGIN
    CREATE INDEX [IX_OrderMenu_InvoiceID] ON [OrderMenu] ([InvoiceID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005054744_initTableOrderMenu')
BEGIN
    CREATE INDEX [IX_OrderMenu_MenuId] ON [OrderMenu] ([MenuId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005054744_initTableOrderMenu')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231005054744_initTableOrderMenu', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005092554_changeUserIdTableInvoice')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Invoice]') AND [c].[name] = N'UserId');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Invoice] DROP CONSTRAINT [' + @var5 + '];');
    ALTER TABLE [Invoice] ALTER COLUMN [UserId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005092554_changeUserIdTableInvoice')
BEGIN
    CREATE INDEX [IX_Invoice_UserId] ON [Invoice] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005092554_changeUserIdTableInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD CONSTRAINT [FK_Invoice_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231005092554_changeUserIdTableInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231005092554_changeUserIdTableInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152045_BranchUpdateImg')
BEGIN
    EXEC sp_rename N'[Branch].[Id]', N'BranchId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152045_BranchUpdateImg')
BEGIN
    DECLARE @var6 sysname;
    SELECT @var6 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Branch]') AND [c].[name] = N'Description');
    IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Branch] DROP CONSTRAINT [' + @var6 + '];');
    ALTER TABLE [Branch] ALTER COLUMN [Description] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152045_BranchUpdateImg')
BEGIN
    ALTER TABLE [Branch] ADD [Image] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152045_BranchUpdateImg')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231009152045_BranchUpdateImg', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152406_HallInitTable')
BEGIN
    CREATE TABLE [Hall] (
        [HallId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [Description] nvarchar(max) NULL,
        [Image] nvarchar(max) NULL,
        [BranchId] int NOT NULL,
        CONSTRAINT [PK_Hall] PRIMARY KEY ([HallId]),
        CONSTRAINT [FK_Hall_Branch_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [Branch] ([BranchId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152406_HallInitTable')
BEGIN
    CREATE INDEX [IX_Hall_BranchId] ON [Hall] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231009152406_HallInitTable')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231009152406_HallInitTable', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231010044602_updateFieldTableBranch')
BEGIN
    ALTER TABLE [Branch] ADD [Address] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231010044602_updateFieldTableBranch')
BEGIN
    ALTER TABLE [Branch] ADD [Phone] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231010044602_updateFieldTableBranch')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231010044602_updateFieldTableBranch', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012032614_addColBranchInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [BranchId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012032614_addColBranchInvoice')
BEGIN
    CREATE INDEX [IX_Invoice_BranchId] ON [Invoice] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012032614_addColBranchInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD CONSTRAINT [FK_Invoice_Branch_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [Branch] ([BranchId]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012032614_addColBranchInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231012032614_addColBranchInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012033142_addColHallInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [HallId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012033142_addColHallInvoice')
BEGIN
    CREATE INDEX [IX_Invoice_HallId] ON [Invoice] ([HallId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012033142_addColHallInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD CONSTRAINT [FK_Invoice_Hall_HallId] FOREIGN KEY ([HallId]) REFERENCES [Hall] ([HallId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012033142_addColHallInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231012033142_addColHallInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012151501_addColImgServiceEntity')
BEGIN
    ALTER TABLE [ServiceEntity] ADD [Image] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012151501_addColImgServiceEntity')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231012151501_addColImgServiceEntity', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012165150_addTableOrderService')
BEGIN
    CREATE TABLE [OrderService] (
        [OrderServiceId] int NOT NULL IDENTITY,
        [InvoiceID] int NULL,
        [ServiceId] int NULL,
        CONSTRAINT [PK_OrderService] PRIMARY KEY ([OrderServiceId]),
        CONSTRAINT [FK_OrderService_Invoice_InvoiceID] FOREIGN KEY ([InvoiceID]) REFERENCES [Invoice] ([InvoiceID]),
        CONSTRAINT [FK_OrderService_ServiceEntity_ServiceId] FOREIGN KEY ([ServiceId]) REFERENCES [ServiceEntity] ([ServiceId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012165150_addTableOrderService')
BEGIN
    CREATE INDEX [IX_OrderService_InvoiceID] ON [OrderService] ([InvoiceID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012165150_addTableOrderService')
BEGIN
    CREATE INDEX [IX_OrderService_ServiceId] ON [OrderService] ([ServiceId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012165150_addTableOrderService')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231012165150_addTableOrderService', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012174531_addDateTableInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [InvoiceDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231012174531_addDateTableInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231012174531_addDateTableInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013020509_addTableComboMenu')
BEGIN
    ALTER TABLE [MenuEntity] ADD [ComboMenuEntityComboMenuId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013020509_addTableComboMenu')
BEGIN
    CREATE TABLE [ComboMenuEntity] (
        [ComboMenuId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_ComboMenuEntity] PRIMARY KEY ([ComboMenuId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013020509_addTableComboMenu')
BEGIN
    CREATE INDEX [IX_MenuEntity_ComboMenuEntityComboMenuId] ON [MenuEntity] ([ComboMenuEntityComboMenuId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013020509_addTableComboMenu')
BEGIN
    ALTER TABLE [MenuEntity] ADD CONSTRAINT [FK_MenuEntity_ComboMenuEntity_ComboMenuEntityComboMenuId] FOREIGN KEY ([ComboMenuEntityComboMenuId]) REFERENCES [ComboMenuEntity] ([ComboMenuId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013020509_addTableComboMenu')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231013020509_addTableComboMenu', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    ALTER TABLE [MenuEntity] DROP CONSTRAINT [FK_MenuEntity_ComboMenuEntity_ComboMenuEntityComboMenuId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    DROP INDEX [IX_MenuEntity_ComboMenuEntityComboMenuId] ON [MenuEntity];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    DECLARE @var7 sysname;
    SELECT @var7 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MenuEntity]') AND [c].[name] = N'ComboMenuEntityComboMenuId');
    IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [MenuEntity] DROP CONSTRAINT [' + @var7 + '];');
    ALTER TABLE [MenuEntity] DROP COLUMN [ComboMenuEntityComboMenuId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    CREATE TABLE [MenuItemComboMenu] (
        [MenuItemComboMenuId] int NOT NULL IDENTITY,
        [MenuId] int NOT NULL,
        [ComboMenuId] int NOT NULL,
        CONSTRAINT [PK_MenuItemComboMenu] PRIMARY KEY ([MenuItemComboMenuId]),
        CONSTRAINT [FK_MenuItemComboMenu_ComboMenuEntity_ComboMenuId] FOREIGN KEY ([ComboMenuId]) REFERENCES [ComboMenuEntity] ([ComboMenuId]) ON DELETE CASCADE,
        CONSTRAINT [FK_MenuItemComboMenu_MenuEntity_MenuId] FOREIGN KEY ([MenuId]) REFERENCES [MenuEntity] ([MenuId]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    CREATE INDEX [IX_MenuItemComboMenu_ComboMenuId] ON [MenuItemComboMenu] ([ComboMenuId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    CREATE INDEX [IX_MenuItemComboMenu_MenuId] ON [MenuItemComboMenu] ([MenuId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013021311_addTableMenuItemComboMenu')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231013021311_addTableMenuItemComboMenu', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013035304_addColComboPrice')
BEGIN
    ALTER TABLE [ComboMenuEntity] ADD [ComboPrice] float NOT NULL DEFAULT 0.0E0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013035304_addColComboPrice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231013035304_addColComboPrice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013064711_addColIsLockedBranch')
BEGIN
    ALTER TABLE [Branch] ADD [IsLocked] bit NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231013064711_addColIsLockedBranch')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231013064711_addColIsLockedBranch', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231016211656_addTableFeedback')
BEGIN
    CREATE TABLE [Feedback] (
        [FeedbackId] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NULL,
        [FeedbackDate] datetime2 NULL,
        [Content] nvarchar(max) NULL,
        [Rating] float NULL,
        CONSTRAINT [PK_Feedback] PRIMARY KEY ([FeedbackId]),
        CONSTRAINT [FK_Feedback_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231016211656_addTableFeedback')
BEGIN
    CREATE INDEX [IX_Feedback_UserId] ON [Feedback] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231016211656_addTableFeedback')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231016211656_addTableFeedback', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017081644_addBranchIdForTableFeedback')
BEGIN
    ALTER TABLE [Feedback] ADD [BranchId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017081644_addBranchIdForTableFeedback')
BEGIN
    CREATE INDEX [IX_Feedback_BranchId] ON [Feedback] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017081644_addBranchIdForTableFeedback')
BEGIN
    ALTER TABLE [Feedback] ADD CONSTRAINT [FK_Feedback_Branch_BranchId] FOREIGN KEY ([BranchId]) REFERENCES [Branch] ([BranchId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231017081644_addBranchIdForTableFeedback')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231017081644_addBranchIdForTableFeedback', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104251_addColTableHall')
BEGIN
    ALTER TABLE [Hall] ADD [Capacity] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104251_addColTableHall')
BEGIN
    ALTER TABLE [Hall] ADD [HallDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104251_addColTableHall')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231019104251_addColTableHall', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104601_addColPriceTableHall')
BEGIN
    ALTER TABLE [Hall] ADD [Price] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104601_addColPriceTableHall')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231019104601_addColPriceTableHall', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104726_delColDateTableHall')
BEGIN
    DECLARE @var8 sysname;
    SELECT @var8 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Hall]') AND [c].[name] = N'HallDate');
    IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Hall] DROP CONSTRAINT [' + @var8 + '];');
    ALTER TABLE [Hall] DROP COLUMN [HallDate];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231019104726_delColDateTableHall')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231019104726_delColDateTableHall', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020042114_addColAttendanceDateForTableInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [AttendanceDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020042114_addColAttendanceDateForTableInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231020042114_addColAttendanceDateForTableInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020045029_addColTotalForTableInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [Total] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020045029_addColTotalForTableInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231020045029_addColTotalForTableInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020054253_addColNamePhoneNoteInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [FullName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020054253_addColNamePhoneNoteInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [Note] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020054253_addColNamePhoneNoteInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [PhoneNumber] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231020054253_addColNamePhoneNoteInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231020054253_addColNamePhoneNoteInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021054848_addTableCode')
BEGIN
    CREATE TABLE [Code] (
        [CodeId] int NOT NULL IDENTITY,
        [CodeString] nvarchar(max) NULL,
        [Discount] float NULL,
        CONSTRAINT [PK_Code] PRIMARY KEY ([CodeId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021054848_addTableCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231021054848_addTableCode', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021055047_addTableInvoiceCode')
BEGIN
    CREATE TABLE [InvoiceCode] (
        [InvoiceCodeId] int NOT NULL IDENTITY,
        [InvoiceId] int NOT NULL,
        [CodeId] int NOT NULL,
        CONSTRAINT [PK_InvoiceCode] PRIMARY KEY ([InvoiceCodeId]),
        CONSTRAINT [FK_InvoiceCode_Code_CodeId] FOREIGN KEY ([CodeId]) REFERENCES [Code] ([CodeId]) ON DELETE CASCADE,
        CONSTRAINT [FK_InvoiceCode_Invoice_InvoiceId] FOREIGN KEY ([InvoiceId]) REFERENCES [Invoice] ([InvoiceID]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021055047_addTableInvoiceCode')
BEGIN
    CREATE INDEX [IX_InvoiceCode_CodeId] ON [InvoiceCode] ([CodeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021055047_addTableInvoiceCode')
BEGIN
    CREATE INDEX [IX_InvoiceCode_InvoiceId] ON [InvoiceCode] ([InvoiceId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021055047_addTableInvoiceCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231021055047_addTableInvoiceCode', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    ALTER TABLE [InvoiceCode] DROP CONSTRAINT [FK_InvoiceCode_Code_CodeId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    ALTER TABLE [InvoiceCode] DROP CONSTRAINT [FK_InvoiceCode_Invoice_InvoiceId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    DECLARE @var9 sysname;
    SELECT @var9 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InvoiceCode]') AND [c].[name] = N'InvoiceId');
    IF @var9 IS NOT NULL EXEC(N'ALTER TABLE [InvoiceCode] DROP CONSTRAINT [' + @var9 + '];');
    ALTER TABLE [InvoiceCode] ALTER COLUMN [InvoiceId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    DECLARE @var10 sysname;
    SELECT @var10 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[InvoiceCode]') AND [c].[name] = N'CodeId');
    IF @var10 IS NOT NULL EXEC(N'ALTER TABLE [InvoiceCode] DROP CONSTRAINT [' + @var10 + '];');
    ALTER TABLE [InvoiceCode] ALTER COLUMN [CodeId] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    ALTER TABLE [Code] ADD [ExpirationDate] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    ALTER TABLE [Code] ADD [Quantity] int NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    ALTER TABLE [InvoiceCode] ADD CONSTRAINT [FK_InvoiceCode_Code_CodeId] FOREIGN KEY ([CodeId]) REFERENCES [Code] ([CodeId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    ALTER TABLE [InvoiceCode] ADD CONSTRAINT [FK_InvoiceCode_Invoice_InvoiceId] FOREIGN KEY ([InvoiceId]) REFERENCES [Invoice] ([InvoiceID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021080328_addColForTableCode')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231021080328_addColForTableCode', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021114852_addColTotalBeforeDiscountTableInvoice')
BEGIN
    ALTER TABLE [Invoice] ADD [TotalBeforeDiscount] float NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231021114852_addColTotalBeforeDiscountTableInvoice')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231021114852_addColTotalBeforeDiscountTableInvoice', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231106100658_addTableRoom&Message')
BEGIN
    CREATE TABLE [Room] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NOT NULL,
        [AdminId] nvarchar(450) NULL,
        CONSTRAINT [PK_Room] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Room_AspNetUsers_AdminId] FOREIGN KEY ([AdminId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231106100658_addTableRoom&Message')
BEGIN
    CREATE TABLE [Message] (
        [Id] int NOT NULL IDENTITY,
        [Content] nvarchar(max) NOT NULL,
        [Timestamp] datetime2 NOT NULL,
        [ToRoomId] int NOT NULL,
        [FromUserId] nvarchar(450) NULL,
        CONSTRAINT [PK_Message] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Message_AspNetUsers_FromUserId] FOREIGN KEY ([FromUserId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_Message_Room_ToRoomId] FOREIGN KEY ([ToRoomId]) REFERENCES [Room] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231106100658_addTableRoom&Message')
BEGIN
    CREATE INDEX [IX_Message_FromUserId] ON [Message] ([FromUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231106100658_addTableRoom&Message')
BEGIN
    CREATE INDEX [IX_Message_ToRoomId] ON [Message] ([ToRoomId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231106100658_addTableRoom&Message')
BEGIN
    CREATE INDEX [IX_Room_AdminId] ON [Room] ([AdminId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20231106100658_addTableRoom&Message')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20231106100658_addTableRoom&Message', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314060809_notification')
BEGIN
    CREATE TABLE [HubConnections] (
        [Id] int NOT NULL IDENTITY,
        [ConnectionId] nvarchar(max) NOT NULL,
        [Username] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_HubConnections] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314060809_notification')
BEGIN
    CREATE TABLE [Notifications] (
        [Id] int NOT NULL IDENTITY,
        [Username] nvarchar(max) NOT NULL,
        [Message] nvarchar(max) NOT NULL,
        [MessageType] nvarchar(max) NOT NULL,
        [NotificationDateTime] datetime2 NOT NULL,
        CONSTRAINT [PK_Notifications] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314060809_notification')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240314060809_notification', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    ALTER TABLE [Notifications] DROP CONSTRAINT [PK_Notifications];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    ALTER TABLE [HubConnections] DROP CONSTRAINT [PK_HubConnections];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    EXEC sp_rename N'[Notifications]', N'Notification';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    EXEC sp_rename N'[HubConnections]', N'HubConnection';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    ALTER TABLE [Notification] ADD CONSTRAINT [PK_Notification] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    ALTER TABLE [HubConnection] ADD CONSTRAINT [PK_HubConnection] PRIMARY KEY ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240314062643_changeTableCodeFirst')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240314062643_changeTableCodeFirst', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240315135139_addColAvatarNotification')
BEGIN
    ALTER TABLE [Notification] ADD [Avatar] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240315135139_addColAvatarNotification')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240315135139_addColAvatarNotification', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240316155953_addTableChatSignalR')
BEGIN
    CREATE TABLE [Chat] (
        [Id] int NOT NULL IDENTITY,
        [Username] nvarchar(max) NOT NULL,
        [Message] nvarchar(max) NOT NULL,
        [MessageType] nvarchar(max) NOT NULL,
        [NotificationDateTime] datetime2 NOT NULL,
        [Avatar] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Chat] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240316155953_addTableChatSignalR')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240316155953_addTableChatSignalR', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240324054041_ChatUserId')
BEGIN
    DECLARE @var11 sysname;
    SELECT @var11 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Chat]') AND [c].[name] = N'Username');
    IF @var11 IS NOT NULL EXEC(N'ALTER TABLE [Chat] DROP CONSTRAINT [' + @var11 + '];');
    ALTER TABLE [Chat] DROP COLUMN [Username];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240324054041_ChatUserId')
BEGIN
    EXEC sp_rename N'[Chat].[Id]', N'ChatId', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240324054041_ChatUserId')
BEGIN
    ALTER TABLE [Chat] ADD [UserId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240324054041_ChatUserId')
BEGIN
    CREATE INDEX [IX_Chat_UserId] ON [Chat] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240324054041_ChatUserId')
BEGIN
    ALTER TABLE [Chat] ADD CONSTRAINT [FK_Chat_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240324054041_ChatUserId')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240324054041_ChatUserId', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240325135812_addTableChatRoom')
BEGIN
    CREATE TABLE [ChatRoom] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(100) NOT NULL,
        CONSTRAINT [PK_ChatRoom] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240325135812_addTableChatRoom')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240325135812_addTableChatRoom', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240325140333_addTableChatRoomUser')
BEGIN
    CREATE TABLE [ChatRoomUser] (
        [Id] int NOT NULL IDENTITY,
        [ChatRoomId] int NOT NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_ChatRoomUser] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_ChatRoomUser_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_ChatRoomUser_ChatRoom_ChatRoomId] FOREIGN KEY ([ChatRoomId]) REFERENCES [ChatRoom] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240325140333_addTableChatRoomUser')
BEGIN
    CREATE INDEX [IX_ChatRoomUser_ChatRoomId] ON [ChatRoomUser] ([ChatRoomId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240325140333_addTableChatRoomUser')
BEGIN
    CREATE INDEX [IX_ChatRoomUser_UserId] ON [ChatRoomUser] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240325140333_addTableChatRoomUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240325140333_addTableChatRoomUser', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240326113955_addPKChatRoomInChatDataId2')
BEGIN
    ALTER TABLE [Chat] ADD [ChatRoomDataId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240326113955_addPKChatRoomInChatDataId2')
BEGIN
    CREATE INDEX [IX_Chat_ChatRoomDataId] ON [Chat] ([ChatRoomDataId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240326113955_addPKChatRoomInChatDataId2')
BEGIN
    ALTER TABLE [Chat] ADD CONSTRAINT [FK_Chat_ChatRoom_ChatRoomDataId] FOREIGN KEY ([ChatRoomDataId]) REFERENCES [ChatRoom] ([Id]) ON DELETE CASCADE;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240326113955_addPKChatRoomInChatDataId2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240326113955_addPKChatRoomInChatDataId2', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240327013644_addTableChatPrivate')
BEGIN
    CREATE TABLE [ChatPrivate] (
        [ChatPrivateId] int NOT NULL IDENTITY,
        [SenderUserId] nvarchar(450) NULL,
        [ReceiverUserId] nvarchar(450) NULL,
        [Message] nvarchar(max) NOT NULL,
        [NotificationDateTime] datetime2 NOT NULL,
        CONSTRAINT [PK_ChatPrivate] PRIMARY KEY ([ChatPrivateId]),
        CONSTRAINT [FK_ChatPrivate_AspNetUsers_ReceiverUserId] FOREIGN KEY ([ReceiverUserId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_ChatPrivate_AspNetUsers_SenderUserId] FOREIGN KEY ([SenderUserId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240327013644_addTableChatPrivate')
BEGIN
    CREATE INDEX [IX_ChatPrivate_ReceiverUserId] ON [ChatPrivate] ([ReceiverUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240327013644_addTableChatPrivate')
BEGIN
    CREATE INDEX [IX_ChatPrivate_SenderUserId] ON [ChatPrivate] ([SenderUserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240327013644_addTableChatPrivate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240327013644_addTableChatPrivate', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240418135729_addColSessionIdTableApplicationUser')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [SessionId] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240418135729_addColSessionIdTableApplicationUser')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240418135729_addColSessionIdTableApplicationUser', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240421115445_addTableImageChatToTableChatPrivate')
BEGIN
    ALTER TABLE [ChatPrivate] ADD [ImageChat] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240421115445_addTableImageChatToTableChatPrivate')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240421115445_addTableImageChatToTableChatPrivate', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240421125545_addImageChatRoomInTableChat')
BEGIN
    ALTER TABLE [Chat] ADD [ImageChatRoom] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240421125545_addImageChatRoomInTableChat')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240421125545_addImageChatRoomInTableChat', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240426020128_addTableProject')
BEGIN
    CREATE TABLE [Project] (
        [ProjectId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        CONSTRAINT [PK_Project] PRIMARY KEY ([ProjectId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240426020128_addTableProject')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240426020128_addTableProject', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240426020703_addTableTaskToDo')
BEGIN
    CREATE TABLE [TaskToDo] (
        [TaskId] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Position] int NULL,
        [ProjectId] int NULL,
        CONSTRAINT [PK_TaskToDo] PRIMARY KEY ([TaskId]),
        CONSTRAINT [FK_TaskToDo_Project_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [Project] ([ProjectId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240426020703_addTableTaskToDo')
BEGIN
    CREATE INDEX [IX_TaskToDo_ProjectId] ON [TaskToDo] ([ProjectId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240426020703_addTableTaskToDo')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240426020703_addTableTaskToDo', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [TaskToDo] ADD [CreatedAt] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [TaskToDo] ADD [Priority] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [TaskToDo] ADD [UpdatedAt] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [TaskToDo] ADD [UserId] nvarchar(450) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [Project] ADD [CreatedAt] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [Project] ADD [UpdatedAt] datetime2 NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    CREATE INDEX [IX_TaskToDo_UserId] ON [TaskToDo] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    ALTER TABLE [TaskToDo] ADD CONSTRAINT [FK_TaskToDo_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240429031050_addColForTableProjectAndChatToDo')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240429031050_addColForTableProjectAndChatToDo', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240501110702_addColorTableProject')
BEGIN
    ALTER TABLE [Project] ADD [IconColor] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240501110702_addColorTableProject')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240501110702_addColorTableProject', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240502095500_TaskToDoAddTaskColor')
BEGIN
    ALTER TABLE [TaskToDo] ADD [TaskColor] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240502095500_TaskToDoAddTaskColor')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240502095500_TaskToDoAddTaskColor', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504063928_tableUserListTask')
BEGIN
    CREATE TABLE [UserListTask] (
        [UserListTaskId] int NOT NULL IDENTITY,
        [TaskId] int NULL,
        [UserId] nvarchar(450) NULL,
        CONSTRAINT [PK_UserListTask] PRIMARY KEY ([UserListTaskId]),
        CONSTRAINT [FK_UserListTask_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_UserListTask_TaskToDo_TaskId] FOREIGN KEY ([TaskId]) REFERENCES [TaskToDo] ([TaskId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504063928_tableUserListTask')
BEGIN
    CREATE INDEX [IX_UserListTask_TaskId] ON [UserListTask] ([TaskId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504063928_tableUserListTask')
BEGIN
    CREATE INDEX [IX_UserListTask_UserId] ON [UserListTask] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504063928_tableUserListTask')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240504063928_tableUserListTask', N'7.0.11');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504151854_TableTaskComment')
BEGIN
    CREATE TABLE [TaskComment] (
        [TaskCommentId] int NOT NULL IDENTITY,
        [TaskId] int NULL,
        [UserId] nvarchar(450) NULL,
        [Comment] nvarchar(max) NULL,
        [CreatedAt] datetime2 NULL,
        CONSTRAINT [PK_TaskComment] PRIMARY KEY ([TaskCommentId]),
        CONSTRAINT [FK_TaskComment_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_TaskComment_TaskToDo_TaskId] FOREIGN KEY ([TaskId]) REFERENCES [TaskToDo] ([TaskId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504151854_TableTaskComment')
BEGIN
    CREATE INDEX [IX_TaskComment_TaskId] ON [TaskComment] ([TaskId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504151854_TableTaskComment')
BEGIN
    CREATE INDEX [IX_TaskComment_UserId] ON [TaskComment] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20240504151854_TableTaskComment')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20240504151854_TableTaskComment', N'7.0.11');
END;
GO

COMMIT;
GO

