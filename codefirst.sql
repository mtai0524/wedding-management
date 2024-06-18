USE [codefirst]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/19/2024 12:08:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Avatar] [nvarchar](max) NULL,
	[SessionId] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[IsLocked] [bit] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[ChatId] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[MessageType] [nvarchar](max) NOT NULL,
	[NotificationDateTime] [datetime2](7) NOT NULL,
	[Avatar] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[ChatRoomDataId] [int] NULL,
	[ImageChatRoom] [nvarchar](max) NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[ChatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatPrivate]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatPrivate](
	[ChatPrivateId] [int] IDENTITY(1,1) NOT NULL,
	[SenderUserId] [nvarchar](450) NULL,
	[ReceiverUserId] [nvarchar](450) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[NotificationDateTime] [datetime2](7) NOT NULL,
	[ImageChat] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChatPrivate] PRIMARY KEY CLUSTERED 
(
	[ChatPrivateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatRoom]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatRoom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ChatRoom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatRoomUser]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatRoomUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChatRoomId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ChatRoomUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Code]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Code](
	[CodeId] [int] IDENTITY(1,1) NOT NULL,
	[CodeString] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[ExpirationDate] [datetime2](7) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Code] PRIMARY KEY CLUSTERED 
(
	[CodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComboMenuEntity]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComboMenuEntity](
	[ComboMenuId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ComboPrice] [float] NOT NULL,
 CONSTRAINT [PK_ComboMenuEntity] PRIMARY KEY CLUSTERED 
(
	[ComboMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Avatar] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[FeedbackDate] [datetime2](7) NULL,
	[Content] [nvarchar](max) NULL,
	[Rating] [float] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[HallId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[BranchId] [int] NOT NULL,
	[Capacity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[HallId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HubConnection]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HubConnection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConnectionId] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_HubConnection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[BranchId] [int] NOT NULL,
	[HallId] [int] NOT NULL,
	[InvoiceDate] [datetime2](7) NULL,
	[AttendanceDate] [datetime2](7) NULL,
	[Total] [float] NULL,
	[FullName] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[TotalBeforeDiscount] [float] NULL,
	[PaymentStatus] [bit] NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[TimeHall] [nvarchar](max) NULL,
	[PaymentWallet] [bit] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceCode]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceCode](
	[InvoiceCodeId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceId] [int] NULL,
	[CodeId] [int] NULL,
 CONSTRAINT [PK_InvoiceCode] PRIMARY KEY CLUSTERED 
(
	[InvoiceCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_MenuCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuEntity]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuEntity](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_MenuEntity] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItemComboMenu]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItemComboMenu](
	[MenuItemComboMenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NOT NULL,
	[ComboMenuId] [int] NOT NULL,
 CONSTRAINT [PK_MenuItemComboMenu] PRIMARY KEY CLUSTERED 
(
	[MenuItemComboMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[MessageType] [nvarchar](max) NOT NULL,
	[NotificationDateTime] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMenu]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMenu](
	[OrderMenuId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[MenuId] [int] NULL,
 CONSTRAINT [PK_OrderMenu] PRIMARY KEY CLUSTERED 
(
	[OrderMenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[OrderServiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NULL,
	[ServiceId] [int] NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[OrderServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NULL,
	[CanAdd] [bit] NULL,
	[CanDelete] [bit] NULL,
	[CanEdit] [bit] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceEntity]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceEntity](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_ServiceEntity] PRIMARY KEY CLUSTERED 
(
	[ServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskComment]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskComment](
	[TaskCommentId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NULL,
	[UserId] [nvarchar](450) NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_TaskComment] PRIMARY KEY CLUSTERED 
(
	[TaskCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskToDo]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskToDo](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Position] [int] NULL,
	[ProjectId] [int] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[Priority] [nvarchar](max) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[UserId] [nvarchar](450) NULL,
	[TaskColor] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaskToDo] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeOfDay]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeOfDay](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HallId] [int] NULL,
	[Morning] [nvarchar](max) NULL,
	[Afternoon] [nvarchar](max) NULL,
	[Dinner] [nvarchar](max) NULL,
 CONSTRAINT [PK_TimeOfDay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserListTask]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserListTask](
	[UserListTaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_UserListTask] PRIMARY KEY CLUSTERED 
(
	[UserListTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 6/19/2024 12:08:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[WalletId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[Coin] [float] NULL,
 CONSTRAINT [PK_Wallet] PRIMARY KEY CLUSTERED 
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230916025554_InitialDatabaseSetup', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230916032941_IdentityTables', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230916040113_AddNewInforUser', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230917081630_updateEmpployee', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230917182910_addAvatarUser', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230918153322_addBranch', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230918153546_addAvatarEmployee', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230918154111_upBranch', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919012557_initServiceCategories', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919012737_initServiceEntity', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919012857_updateNotNullServiceEntity', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919013348_updatePriceDescriptionServiceEntity', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919014145_updateFkNullServiceEntity', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230919014638_updateService', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230922135930_addTableMenuCategory', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230922140039_addTableMenu', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230926033853_imgTableMenu', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231005054412_initTableInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231005054744_initTableOrderMenu', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231005092554_changeUserIdTableInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009152045_BranchUpdateImg', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009152406_HallInitTable', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231010044602_updateFieldTableBranch', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231012032614_addColBranchInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231012033142_addColHallInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231012151501_addColImgServiceEntity', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231012165150_addTableOrderService', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231012174531_addDateTableInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231013020509_addTableComboMenu', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231013021311_addTableMenuItemComboMenu', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231013035304_addColComboPrice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231013064711_addColIsLockedBranch', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231016211656_addTableFeedback', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231017081644_addBranchIdForTableFeedback', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231019104251_addColTableHall', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231019104601_addColPriceTableHall', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231019104726_delColDateTableHall', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020042114_addColAttendanceDateForTableInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020045029_addColTotalForTableInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231020054253_addColNamePhoneNoteInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231021054848_addTableCode', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231021055047_addTableInvoiceCode', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231021080328_addColForTableCode', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231021114852_addColTotalBeforeDiscountTableInvoice', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231106100658_addTableRoom&Message', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240314060809_notification', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240314062643_changeTableCodeFirst', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240315135139_addColAvatarNotification', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240316155953_addTableChatSignalR', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240324054041_ChatUserId', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240325135812_addTableChatRoom', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240325140333_addTableChatRoomUser', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240326113955_addPKChatRoomInChatDataId2', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240327013644_addTableChatPrivate', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240418135729_addColSessionIdTableApplicationUser', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240421115445_addTableImageChatToTableChatPrivate', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240421125545_addImageChatRoomInTableChat', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240426020128_addTableProject', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240426020703_addTableTaskToDo', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240429031050_addColForTableProjectAndChatToDo', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240501110702_addColorTableProject', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240502095500_TaskToDoAddTaskColor', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240504063928_tableUserListTask', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240504151854_TableTaskComment', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240511110042_addColPaymentStatus', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240512011226_removeColProject', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240512021748_changeTableNoti', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240512183503_addColInvoiceOrderStatus', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516013907_PerTable', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516121642_PermissionCol', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240602044250_tableTimeOfDay', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240602122232_addColTimeHall', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240618031531_WalletTable', N'7.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240618054321_PaymentWallet', N'7.0.11')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator]) VALUES (N'19bd9499-008b-483a-b52b-9596f89e04fc', N'employee', N'EMPLOYEE', N'b422d3c1-1af3-467a-baaa-e35e421f5066', N'')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator]) VALUES (N'a64e8afb-b8c4-4a32-b79f-d4eedc9606a8', N'user', N'USER', N'38dadd99-4d95-44f1-abd3-5114a1c5d9ba', N'')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator]) VALUES (N'c892040c-ec2f-44bc-a528-cddf39d00fb9', N'administrator system', N'ADMINISTRATOR SYSTEM', N'74853aa2-43bc-4ff8-ae28-e20034ef1109', N'')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp], [Discriminator]) VALUES (N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', N'admin', N'ADMIN', N'fcb67cba-6bba-4a15-ae8c-1c0b1c8e8cff', N'')
GO
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Facebook', N'1982040665498167', N'Facebook', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [ProviderDisplayName], [UserId]) VALUES (N'Google', N'115108247015046199411', N'Google', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'c892040c-ec2f-44bc-a528-cddf39d00fb9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12116240-b504-41bf-bcf6-9e906612ee3e', N'19bd9499-008b-483a-b52b-9596f89e04fc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'98e152ed-a5d9-4ccb-93cf-ea5edf4e067c', N'19bd9499-008b-483a-b52b-9596f89e04fc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a733eed2-a179-4aa1-9624-3885a129c89b', N'a64e8afb-b8c4-4a32-b79f-d4eedc9606a8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'c892040c-ec2f-44bc-a528-cddf39d00fb9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'c892040c-ec2f-44bc-a528-cddf39d00fb9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'06864e92-11bd-49fd-af39-50de16beadb4', N'codefirst@gmail.com', N'CODEFIRST@GMAIL.COM', N'codefirst@gmail.com', N'CODEFIRST@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENXdMc/o1/V4A8fxhJNZyVcr9R9LePuMOPSZ417gzK1pjsP3oFD+Z3m5st+x29pmCg==', N'TEOHBSA7CIDTH55BPYLBVTBBXZWSQMW7', N'77159b03-d484-4aa6-83d0-ed94ab851073', NULL, 0, 0, NULL, 1, 0, N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'adminsystem@gmail.com', N'ADMINSYSTEM@GMAIL.COM', N'adminsystem@gmail.com', N'ADMINSYSTEM@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEAVKsb/MY1Fr3UWxsx6gHpyaDhjAJBYScaLFgf6oJw3xFK+h6khWlD+44hxk8DfKeQ==', N'YICEV3BF65BPJFJP6AS5IJS3A3KGOXXL', N'b28afe6d-d369-4813-9f5d-a2635a38fa61', N'0795896039', 0, 0, NULL, 1, 0, N'ApplicationUser', N'quản trị', N'hệ thống', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713795363/wub0yg8ntipq5djjc4eu.jpg', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'12116240-b504-41bf-bcf6-9e906612ee3e', N'testchat@gmail.com', N'TESTCHAT@GMAIL.COM', N'testchat@gmail.com', N'TESTCHAT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENQv6gdKBBS32NvkVNJgUpDayHhL2w54HQxqID70BICqhIFTRj0KrSFW/nh77leMEg==', N'23IU7BCYHK4V2Y2H6KOBVJWYLAQBI4UY', N'c370f455-df79-44fc-b959-e4849d657244', NULL, 0, 0, NULL, 0, 0, N'ApplicationUser', N'chú 6', N'bán cháo', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1711173486/xgjzdekrfx7svd0tr8gb.png', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'98e152ed-a5d9-4ccb-93cf-ea5edf4e067c', N'testweb@zalo.com', N'TESTWEB@ZALO.COM', N'testweb@zalo.com', N'TESTWEB@ZALO.COM', 1, N'AQAAAAEAACcQAAAAEA0Z/fj6bRyF6p82LTJ0EqYgZLCHi37ONzE3rcgPI9P1xekttPLSmiLbyhguJCDLMg==', N'WL6A3HV25MZGLAVTHGL2HRVVRI3F3DFT', N'ea408a82-c8e6-4616-a872-7cd770694ed6', NULL, 0, 0, CAST(N'9999-12-31T23:59:59.9999999+00:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Gấu trúc', N'ẩn danh', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1709531347/jmqwdfdjj2zx88mtuocr.png', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'anhbaysiu@gmail.com', N'ANHBAYSIU@GMAIL.COM', N'anhbaysiu@gmail.com', N'ANHBAYSIU@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEMB8C3DB20yWTGYxQuwmkrAiMf6Y0is0bDcPXm2DFZ8uXL4XfRuQIobnXCq8OkzzUg==', N'P6LV75SJTJ35M6ODOOFIZG3VTVH7C3AZ', N'a5100cf4-b8c2-47c0-b42e-fd2d356e429a', NULL, 0, 0, NULL, 0, 0, N'ApplicationUser', N'anh', N'bảy', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1711267650/ks7cg9xyssthvxsry2t0.jpg', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'a733eed2-a179-4aa1-9624-3885a129c89b', N'demodoan@gmail.com', N'DEMODOAN@GMAIL.COM', N'demodoan@gmail.com', N'DEMODOAN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEN2IMXVsQft3xf26tXxjuSUrAnpnZ/umdBKulgB0kyxK0SF4qEiJ74YjKsJhm5CPMQ==', N'63GMH2XNOYMUVDVGRWFGCMT5LSHS4CMP', N'892427ee-0e52-4d3e-9cfd-ef3e2201dee1', N'0795896039', 0, 0, NULL, 0, 0, N'ApplicationUser', N'hạt đậu', N'nhỏ', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1718712604/siy1lqxmmeqd1lo1kbmq.png', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'duaconcuagio@yahoo.com', N'DUACONCUAGIO@YAHOO.COM', N'duaconcuagio@yahoo.com', N'DUACONCUAGIO@YAHOO.COM', 1, N'AQAAAAEAACcQAAAAEEbag/LWMIyc357ssXgmD0Ss28wq4lG7Q/44bbToTcxLHgrUWQa9N+G8GSsLJKb7dA==', N'OZ25GR7CZ2BEKZVYKHXVAAMESZF75LSS', N'6a857ea3-f561-4bda-a1bf-4a476d8046b4', N'0795896039', 0, 0, NULL, 1, 0, N'ApplicationUser', N'đấng', N'yasuo', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'983d7fce-a3c4-44e9-b00b-9f4682cd22a2')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'nguyentai24052002@gmail.com', N'NGUYENTAI24052002@GMAIL.COM', N'nguyentai24052002@gmail.com', N'NGUYENTAI24052002@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEJa6LGrv1NLJ9iE2zUxHIENSZkCE6QJv9Gl6GSVIUj3qepOpbK95JdjVtaX9F33vPQ==', N'AP7Y5BFUZ4DPL7LVIPT5SWQOVJMZPD4T', N'2e14379f-1d5e-4961-9e77-a26903178cb8', N'0795896039', 0, 0, NULL, 1, 0, N'ApplicationUser', N'minh', N'tai', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1716914261/td7lzwmlrswx11hjmxxj.jpg', NULL)
GO
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'[AspNetUserStore]', N'AuthenticatorKey', N'DXCEHXIG4K7LUNXOPIM5JZUOYQEEIDHQ')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'[AspNetUserStore]', N'RecoveryCodes', N'c3bae430;b33ead73;a79ce501;961438c8;e2a4043f;d6c80176;aa9e8793;2088799a;21af989b;eac0b84f')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'[AspNetUserStore]', N'AuthenticatorKey', N'NFAR7ERXVMYZFDJWM6AUPT4P2XZ2UJD3')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'[AspNetUserStore]', N'AuthenticatorKey', N'MUFXH7KEK465ZFXOJD5N3FIBDT2IUBHZ')
INSERT [dbo].[AspNetUserTokens] ([UserId], [LoginProvider], [Name], [Value]) VALUES (N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'[AspNetUserStore]', N'RecoveryCodes', N'd3afc189;68641b68;a5068af9;79423b96;d751569e;e777f300;66f41c3a;d3d889f7;3ac40e66;c957ce79')
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (1, N'Chi nhánh 1', N'Không gian rộng rãi, nhân viên chu đáo. Tổ chức tiệc cưới tại đây sẽ mang đến sự hài lòng tuyệt đối.', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696885246/usdl3fs3kbj68tupmj4e.jpg', N'Sài Gòn', N'0795896039', 0)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (2, N'chi nhánh 2', N'Không gian ấm cúng, đội ngũ phục vụ chuyên nghiệp. Tổ chức tiệc cưới tại đây là trải nghiệm tuyệt vời.', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696885367/mktdvsna2ffgmkxnhe1l.jpg', N'Bình Dương', N'0795896039', 0)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (3, N'chi nhánh 3', N'3', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696947043/wcb48vniwvberzaz94nr.jpg', N'Gò Vấp', N'0795896039', 1)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (1002, N'chi nhánh 4', N'Thực đơn phong phú, trang trí tinh tế. Chi nhánh này là sự lựa chọn hoàn hảo cho tiệc cưới của bạn.', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696884529/ktmnhyouikzxgza8udvp.jpg', N'Đồng Tháp', N'0795896039', 0)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (1005, N'Chi nhánh 6', N'aaaa', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1717493346/wdw3x6qybmeu748tbxxb.jpg', N'Sài Gòn', N'1324567891', 0)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (1006, N'Chi nhánh 7 ', N'aaaa', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1717493391/el5bprmch5qrxuloriqj.jpg', N'Sài Gòn', N'0795896039', 0)
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Chat] ON 

INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (7, N'dasd', N'All', CAST(N'2024-06-14T20:54:35.8617874' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, NULL)
INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (8, N'dasd', N'All', CAST(N'2024-06-14T20:54:36.7982659' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, NULL)
INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (9, N'123', N'All', CAST(N'2024-06-14T20:54:37.5969525' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, NULL)
INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (10, N'123213', N'All', CAST(N'2024-06-14T21:32:44.7524454' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1718375582/bd8brervbxejyybqge9m.jpg')
INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (11, N'123213', N'All', CAST(N'2024-06-14T21:50:27.9125173' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, NULL)
INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (12, N'demo', N'All', CAST(N'2024-06-15T18:20:33.8905681' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, NULL)
INSERT [dbo].[Chat] ([ChatId], [Message], [MessageType], [NotificationDateTime], [Avatar], [UserId], [ChatRoomDataId], [ImageChatRoom]) VALUES (13, N'', N'All', CAST(N'2024-06-15T18:20:42.4396063' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715935350/aqx0mcgfzdfgvhlhay4c.png', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 1082, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1718450477/rihuoawukdc3lpy0whim.png')
SET IDENTITY_INSERT [dbo].[Chat] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatPrivate] ON 

INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (234, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-03-28T12:55:49.8696046' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (235, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'3123', CAST(N'2024-03-28T12:56:07.9549000' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (236, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdsad', CAST(N'2024-03-28T12:56:12.9249403' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (237, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N' dasdas das d', CAST(N'2024-03-28T12:56:16.2105967' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (238, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'13123', CAST(N'2024-03-28T12:56:21.0120984' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (239, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'qq', CAST(N'2024-03-28T12:56:25.6339492' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (240, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'xin chao', CAST(N'2024-03-28T12:56:56.1439718' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (241, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123', CAST(N'2024-03-28T12:57:03.8150947' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (242, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdsa', CAST(N'2024-03-28T12:57:07.7778357' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (243, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123123', CAST(N'2024-03-28T12:57:14.1942405' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (244, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dadsad', CAST(N'2024-03-28T12:57:19.7246878' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (245, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123123', CAST(N'2024-03-28T12:57:24.2568264' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (246, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123', CAST(N'2024-03-28T12:57:38.3248615' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (247, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123', CAST(N'2024-03-28T12:57:41.8047883' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (248, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123123', CAST(N'2024-03-28T12:57:54.2508612' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (249, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'wewqe', CAST(N'2024-03-28T13:49:02.5774460' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (254, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'12312', CAST(N'2024-03-28T13:54:24.0783208' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (255, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdasd', CAST(N'2024-03-28T13:54:29.4334311' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (256, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123213', CAST(N'2024-03-28T13:54:33.5432752' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (257, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdasd', CAST(N'2024-03-28T13:54:37.3941226' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (258, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'213123', CAST(N'2024-03-28T13:54:42.4462805' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (259, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-03-28T13:54:48.5598373' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (260, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdas', CAST(N'2024-03-28T13:54:55.8113210' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (263, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'234324', CAST(N'2024-03-28T14:00:21.3255387' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (264, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'GGGGGGGGGGGGGGGGGGGGGGGGGGGGG', CAST(N'2024-03-28T14:00:30.6229637' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (265, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'13213', CAST(N'2024-03-28T14:12:33.4349813' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (267, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'312312', CAST(N'2024-03-28T14:22:43.4889509' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (268, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'12321312', CAST(N'2024-03-28T14:23:19.2858232' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (269, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasdasd', CAST(N'2024-03-28T14:23:24.8932545' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (270, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123', CAST(N'2024-03-28T14:33:12.7667938' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (271, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123123', CAST(N'2024-03-28T14:33:19.5862796' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (274, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'3123123123', CAST(N'2024-03-28T14:36:52.9048205' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (275, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdasd', CAST(N'2024-03-28T14:36:55.8173680' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (276, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'312312', CAST(N'2024-03-28T14:45:27.3775555' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (277, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdsad', CAST(N'2024-03-28T14:45:30.3103268' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (282, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'ok nha', CAST(N'2024-03-28T18:26:29.2877251' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (283, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chao nha', CAST(N'2024-03-28T18:27:24.3317317' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (284, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'dasd', CAST(N'2024-03-28T18:31:36.7147730' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (285, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'123123', CAST(N'2024-03-28T18:33:53.3492159' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (286, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'13dassda adas', CAST(N'2024-03-28T18:33:57.1580963' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (287, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'3123', CAST(N'2024-03-28T18:36:35.2471725' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (288, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'dasdasd', CAST(N'2024-03-28T18:36:44.5015235' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (289, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'xin chao', CAST(N'2024-03-28T18:45:18.1039326' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (290, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasDDDDDDDDDDDD', CAST(N'2024-03-28T18:55:44.3620108' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (291, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'DDDDDDDDDDDDDAAAAAAAAAAAAA', CAST(N'2024-03-28T18:55:55.6164364' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (292, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12312312', CAST(N'2024-03-28T18:57:01.8284292' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (293, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'ok', CAST(N'2024-03-28T18:57:06.2171946' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (294, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dùng ajax riêng cho tin nhắn room', CAST(N'2024-03-28T18:57:25.4117861' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (295, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dsads', CAST(N'2024-03-28T19:00:06.1889385' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (296, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dassad', CAST(N'2024-03-28T19:02:20.5509646' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (297, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'QQQQQQQQQQ', CAST(N'2024-03-28T19:04:30.4711809' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (298, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'########', CAST(N'2024-03-28T19:04:33.5229622' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (299, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'vị trí tin nhắn bị lộn xộn', CAST(N'2024-03-28T19:08:14.4538462' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (300, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dấd', CAST(N'2024-03-28T19:18:50.1913800' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (301, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-03-28T19:19:23.3692054' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (302, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'123123', CAST(N'2024-03-28T19:19:27.7304741' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (303, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'hehe', CAST(N'2024-03-28T19:23:45.1192216' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (304, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'ok', CAST(N'2024-03-28T19:23:53.3485088' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (305, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12312', CAST(N'2024-03-28T19:24:05.1355826' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (306, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'xin chao', CAST(N'2024-03-28T19:28:17.5919453' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (314, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123', CAST(N'2024-03-29T17:04:22.2380543' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (318, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-03-30T16:42:09.0712658' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (319, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasdadsdasdasddasdasd', CAST(N'2024-03-30T16:42:13.6434932' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (320, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'đâsd', CAST(N'2024-03-30T17:15:48.3470658' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1318, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasd', CAST(N'2024-03-30T20:23:33.6728391' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1319, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdsaddasdasddasdasd', CAST(N'2024-03-30T20:23:39.3141206' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1320, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasdasddasd', CAST(N'2024-03-30T20:23:45.9259983' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1321, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdsad', CAST(N'2024-03-30T20:23:50.0414398' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1322, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasd', CAST(N'2024-03-30T20:23:59.6508579' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1323, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdsad', CAST(N'2024-03-30T20:24:04.8314921' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1324, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dfsdfsdfsffdfsdfdads', CAST(N'2024-03-30T21:22:22.8772102' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1325, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'123123', CAST(N'2024-03-30T21:22:25.9623073' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (1326, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-03-30T21:38:13.7539587' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2318, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'dasdasdasdasddasdasdasd', CAST(N'2024-03-30T22:13:59.0328949' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2319, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'đá', CAST(N'2024-03-30T22:24:16.0439700' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2320, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'đasad', CAST(N'2024-03-30T22:28:57.5833082' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2321, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'2231', CAST(N'2024-03-30T22:29:00.7884336' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2322, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fsdfsdfsdfdasdsaddasdasddasdasd', CAST(N'2024-03-30T22:36:23.9695165' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2323, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasd', CAST(N'2024-03-30T22:36:32.9168098' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2324, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'2321312edasdas das das d', CAST(N'2024-03-30T22:36:37.0217441' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2325, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dsadasdasdasd', CAST(N'2024-03-30T22:36:44.7217399' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2326, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasddasdasdasd', CAST(N'2024-03-30T22:36:54.9879314' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2327, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasdsadsad', CAST(N'2024-03-30T22:37:01.3527454' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2328, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'dasdasd', CAST(N'2024-03-30T22:37:17.3277195' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2329, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'dasdsa', CAST(N'2024-03-30T22:37:26.5760787' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2330, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'3123123', CAST(N'2024-03-30T22:37:31.2350119' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2331, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasd', CAST(N'2024-03-30T22:37:33.8723071' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2332, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasd', CAST(N'2024-03-30T22:37:36.8563568' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2333, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123', CAST(N'2024-04-01T09:30:48.7767814' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2334, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'dsadsd', CAST(N'2024-04-01T09:37:38.4141930' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2335, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'3123123', CAST(N'2024-04-01T09:37:46.6842692' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2336, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'xin chao anh bay', CAST(N'2024-04-01T10:24:47.0844920' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2337, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'siuuuuuuuuuuuu ~~~~~', CAST(N'2024-04-01T10:25:17.0496917' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2338, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'chào chú 6 bán cháo', CAST(N'2024-04-01T10:25:41.9033093' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (2339, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'hehhe', CAST(N'2024-04-01T10:26:00.7766028' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3336, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'213', CAST(N'2024-04-01T20:07:06.4528883' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3337, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'3123123', CAST(N'2024-04-01T20:08:12.8631994' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3338, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-01T20:08:15.3889801' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3339, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'1323', CAST(N'2024-04-01T20:08:53.9041155' AS DateTime2), NULL)
GO
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3340, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdsad', CAST(N'2024-04-01T20:09:10.9803721' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3341, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'3123123', CAST(N'2024-04-02T11:58:57.6881622' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3342, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'afasffasfasfasds', CAST(N'2024-04-03T22:40:28.1777139' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3343, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'4324324234', CAST(N'2024-04-03T22:40:41.6757061' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3344, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'hehehehhe', CAST(N'2024-04-03T22:51:38.9256786' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3345, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdas', CAST(N'2024-04-08T11:22:59.8994889' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3347, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'123', CAST(N'2024-04-16T08:23:48.5207627' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3348, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'ok', CAST(N'2024-04-16T08:23:53.8949348' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3349, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'xin chao', CAST(N'2024-04-16T10:30:46.6206413' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3350, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'12323', CAST(N'2024-04-16T10:31:39.1535954' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3351, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'heheh', CAST(N'2024-04-16T10:31:45.5866883' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3352, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdsa', CAST(N'2024-04-16T10:31:56.6091393' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3353, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'eqweqwe', CAST(N'2024-04-16T10:32:07.0700296' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3354, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'eqweqwe', CAST(N'2024-04-16T10:32:13.2903636' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3355, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'123123', CAST(N'2024-04-16T10:32:17.0814842' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3356, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'3123123', CAST(N'2024-04-16T10:32:24.6247777' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3357, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'2132', CAST(N'2024-04-16T10:32:27.5245050' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3358, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'21323', CAST(N'2024-04-16T10:32:30.5244577' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3359, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-16T10:32:33.5872667' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3360, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'hello', CAST(N'2024-04-16T10:37:26.0581697' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3361, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'okk', CAST(N'2024-04-16T10:37:40.9556894' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3362, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'chao', CAST(N'2024-04-16T10:37:48.0042602' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3363, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo chat private', CAST(N'2024-04-17T20:28:51.3209776' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3364, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'demo chat 2', CAST(N'2024-04-17T20:29:02.2055169' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3366, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-18T12:33:02.4576820' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3367, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đâsd', CAST(N'2024-04-18T12:33:05.5124032' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3368, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'test chat private', CAST(N'2024-04-18T12:42:34.5060651' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3369, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'chao', CAST(N'2024-04-18T12:46:56.5928655' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3370, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'hehe', CAST(N'2024-04-18T12:50:52.8605879' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3371, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'234', CAST(N'2024-04-18T12:51:44.3507004' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3372, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'das', CAST(N'2024-04-18T12:58:11.3459402' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3373, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-18T19:23:41.9819424' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3374, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasd', CAST(N'2024-04-18T19:23:45.4341661' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3375, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'32132', CAST(N'2024-04-18T19:23:54.0246915' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3376, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd asd ', CAST(N'2024-04-18T19:32:36.1119217' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3377, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'3123', CAST(N'2024-04-18T19:33:49.0892488' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3378, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'3123', CAST(N'2024-04-18T19:34:58.9032728' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3379, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dsdasd123', CAST(N'2024-04-18T19:36:36.7958557' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3380, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'3213', CAST(N'2024-04-18T19:37:39.3894559' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3383, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'123', CAST(N'2024-04-18T19:41:08.5070813' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3384, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-18T19:42:54.8333064' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3385, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-04-18T19:46:36.8386367' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3386, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-18T19:48:20.9368279' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3387, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-18T20:24:13.4852484' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3388, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasd', CAST(N'2024-04-18T20:24:24.7009847' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3389, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'aaaaaaaaaaaaaaaaaaaaaaaa', CAST(N'2024-04-18T20:24:44.3479539' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3390, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-18T20:40:39.9198341' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3391, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'123213', CAST(N'2024-04-18T20:40:43.2644018' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3392, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'đá', CAST(N'2024-04-18T20:41:01.7494546' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3393, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-18T21:03:10.3202646' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3394, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123', CAST(N'2024-04-18T22:13:31.1776681' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3395, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasddasd', CAST(N'2024-04-18T22:13:46.4264182' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3396, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123', CAST(N'2024-04-19T08:00:20.8133351' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3397, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đá', CAST(N'2024-04-19T10:13:44.9551053' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3398, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đâsd', CAST(N'2024-04-19T10:14:34.8934387' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3399, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'aaaaaaaaaaaaaasssssssssssssss', CAST(N'2024-04-19T10:14:46.3258816' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3401, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'xin chao', CAST(N'2024-04-19T11:55:44.7698037' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3402, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-19T11:57:04.1508246' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3403, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'adsdad', CAST(N'2024-04-19T11:57:21.3535327' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3404, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasdasdasd', CAST(N'2024-04-19T11:59:10.9324403' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3405, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdasd', CAST(N'2024-04-19T12:02:11.0370608' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3406, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdasd', CAST(N'2024-04-19T12:02:40.6142484' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3408, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'xin chao', CAST(N'2024-04-19T12:18:37.1593140' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3409, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-19T12:26:14.2269205' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3410, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasds', CAST(N'2024-04-19T12:30:27.4272019' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3411, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasd', CAST(N'2024-04-19T12:32:54.8042343' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3412, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'21323', CAST(N'2024-04-19T12:33:17.4750162' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3413, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-04-19T12:33:40.3973056' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3414, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đá', CAST(N'2024-04-19T12:49:26.1879661' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3415, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-19T12:49:39.0109127' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3418, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'3123', CAST(N'2024-04-19T15:19:04.3677927' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3419, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-19T15:20:14.6648391' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3420, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'đá', CAST(N'2024-04-19T15:28:16.7624514' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3421, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-19T15:29:34.0475885' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3422, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'21323', CAST(N'2024-04-19T15:36:39.7618171' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3423, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dasdasd', CAST(N'2024-04-19T20:57:07.9294648' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3424, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasddasd', CAST(N'2024-04-19T20:57:31.1343261' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3425, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'1323', CAST(N'2024-04-19T20:57:36.7805395' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3426, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-04-19T20:58:32.6561279' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3427, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'eqwe', CAST(N'2024-04-19T22:15:37.8319134' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3428, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasd', CAST(N'2024-04-19T22:17:07.0624067' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3429, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-19T22:21:35.0551674' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3430, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasd', CAST(N'2024-04-19T22:22:55.6413638' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3431, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasd', CAST(N'2024-04-19T22:24:27.3426003' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3432, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasd', CAST(N'2024-04-20T07:29:50.4213140' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3434, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'asd', CAST(N'2024-04-20T07:31:05.2063319' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3435, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'adsd', CAST(N'2024-04-20T07:37:10.0046185' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3436, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'adsd', CAST(N'2024-04-20T07:42:26.6519438' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3437, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đâsd', CAST(N'2024-04-20T07:59:48.1100876' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3438, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'hjjh', CAST(N'2024-04-20T08:20:00.8673702' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3439, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasd', CAST(N'2024-04-20T10:20:06.5655570' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3440, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasd', CAST(N'2024-04-20T11:19:19.1345463' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3441, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'123', CAST(N'2024-04-20T17:11:57.8674976' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3442, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'aloo', CAST(N'2024-04-20T17:19:27.5053654' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3443, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'xin chao', CAST(N'2024-04-20T17:19:36.7092339' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3444, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'ádasdasdasd ád ád đâsd', CAST(N'2024-04-20T19:53:27.5923175' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3445, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'da                            <input name="Message" id="input-chat-private" style="max-width: calc(100% - 60px); border: none; border-radius: inherit;background-color: transparent; word-wrap: break-word;" type="text" class="form-control" placeholder="Nhập tin nhắn ở đây...">                            <input name="Message" id="input-chat-private" style="max-width: calc(100% - 60px); border: none; border-radius: inherit;background-color: transparent; word-wrap: break-word;" type="text" class="form-control" placeholder="Nhập tin nhắn ở đây...">                            <input name="Message" id="input-chat-private" style="max-width: calc(100% - 60px); border: none; border-radius: inherit;background-color: transparent; word-wrap: break-word;" type="text" class="form-control" placeholder="Nhập tin nhắn ở đây...">                            <input name="Message" id="input-chat-private" style="max-width: calc(100% - 60px); border: none; border-radius: inherit;background-color: transparent; word-wrap: break-word;" type="text" class="form-control" placeholder="Nhập tin nhắn ở đây...">                            <input name="Message" id="input-chat-private" style="max-width: calc(100% - 60px); border: none; border-radius: inherit;background-color: transparent; word-wrap: break-word;" type="text" class="form-control" placeholder="Nhập tin nhắn ở đây...">                            <input name="Message" id="input-chat-private" style="max-width: calc(100% - 60px); border: none; border-radius: inherit;background-color: transparent; word-wrap: break-word;" type="text" class="form-control" placeholder="Nhập tin nhắn ở đây...">', CAST(N'2024-04-20T19:53:38.0871600' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3446, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dasdasdtextarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea textarea ', CAST(N'2024-04-20T19:59:46.2039095' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3447, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'dasdasdsdasdasdasd dasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasddasdasdsdasdasdasd', CAST(N'2024-04-20T20:06:46.6659405' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3448, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'123123', CAST(N'2024-04-20T21:33:48.1515866' AS DateTime2), NULL)
GO
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3449, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'addasadasd', CAST(N'2024-04-20T21:33:52.0309068' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3450, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713670031/ljfqyqdp2haiwhk9nifm.jpg', CAST(N'2024-04-21T10:26:46.8748086' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3451, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713670058/cboxnxv5xyuetdn7xxjp.jpg', CAST(N'2024-04-21T10:27:06.8482475' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3452, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12116240-b504-41bf-bcf6-9e906612ee3e', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713670406/t4tkz3cllojovqt1hqcl.jpg', CAST(N'2024-04-21T10:33:02.5702222' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3453, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713671082/rbnqu2dv6yflgwdbcwsq.jpg', CAST(N'2024-04-21T10:44:18.5914578' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3455, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713673141/q7cufscgsravyp2nynop.jpg', CAST(N'2024-04-21T11:18:37.4860267' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3456, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713673256/ztg2g0qtnmghiaunxhlb.jpg', CAST(N'2024-04-21T11:20:30.0783814' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3457, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713673312/donugoh2m96tohf1pm6k.jpg', CAST(N'2024-04-21T11:21:28.4939847' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3460, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713674344/t1kbdswplfmdxykr55zc.jpg', CAST(N'2024-04-21T11:38:42.9136037' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3461, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713674464/nlkyvddrnxvtptdvrbub.jpg', CAST(N'2024-04-21T11:40:41.2435207' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3462, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdgj', CAST(N'2024-04-21T18:42:50.7757931' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3463, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T18:44:01.8212792' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3464, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-04-21T18:44:04.6110429' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3467, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713699883/ipal7c0egkvr8awahwil.jpg', CAST(N'2024-04-21T18:44:18.1849254' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3468, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdsd', CAST(N'2024-04-21T19:03:35.1106262' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701039/rm0x4veokkzlulyoqpzu.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3469, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:05:17.8674743' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701153/fcjqujemy4tkisgq72wb.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3470, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đâsdasd', CAST(N'2024-04-21T19:11:04.7697502' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701490/hh9gmzhedjqll3ati9im.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3471, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:11:38.6329181' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701521/d2b0wnmuzt9xyddts0fw.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3472, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'adsdasd', CAST(N'2024-04-21T19:11:51.1056919' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3473, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:13:17.8460107' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3474, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:13:23.9598187' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701627/byhbwxbyzcx8ujmolz8f.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3475, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'213123', CAST(N'2024-04-21T19:13:29.4241126' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701631/xaz6wwgkfohnxrrkygyp.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3476, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:18:24.0524827' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3477, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'12123', CAST(N'2024-04-21T19:18:31.8185836' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701935/qzhm5gldqbr0sywfppwt.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3478, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:18:37.9364097' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3479, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-04-21T19:18:40.7994393' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3480, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dadsadasd', CAST(N'2024-04-21T19:19:32.2367162' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713701994/kwbzjss0im4cygywrold.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3481, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'cczasdasd', CAST(N'2024-04-21T19:21:42.5366558' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3482, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-04-21T19:21:50.8476294' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3483, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'adsd', CAST(N'2024-04-21T19:22:03.5096968' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713702148/pasouezdooulg3bj64ye.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3484, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-21T19:27:00.5368057' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713702446/s6rbzanoakhpeqn6iq9k.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3485, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasdasdasddasdasd', CAST(N'2024-04-21T19:40:22.7017125' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3486, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdadasdsad', CAST(N'2024-04-21T19:40:35.5747546' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713703262/fbukufb4u1axt2xnruqv.webp')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3487, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasdasd', CAST(N'2024-04-21T19:40:52.1792917' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3488, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'1212', CAST(N'2024-04-21T19:41:03.1806611' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713703285/tuhgs2ftkjhrymr4dnqm.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3489, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'dsadsa', CAST(N'2024-04-21T19:49:04.3298826' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3490, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'123213', CAST(N'2024-04-21T19:49:11.1325413' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3491, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đasd', CAST(N'2024-04-21T20:40:40.4809039' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713706865/tr7mlssxfgjmve73sppl.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3492, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chao nhe , test gui hinh anh', CAST(N'2024-04-22T18:30:07.4134564' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713785433/wv82bujeaoajfastlr2q.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3494, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'ádasd', CAST(N'2024-04-22T18:54:16.1617924' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713786879/nkihjwkqugf54u16oi22.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3495, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đâsd', CAST(N'2024-04-22T18:54:26.9942895' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713786891/gnq1trgw9wgxbckwl6ww.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3497, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'', CAST(N'2024-04-22T18:56:30.5603726' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787014/mhguvzdinc4edrbi0vse.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3498, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'', CAST(N'2024-04-22T18:56:48.4397545' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787032/tbpcw7jx30w0kh8cmclg.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3499, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'', CAST(N'2024-04-22T18:58:11.3976844' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787116/zjlona8bmudsyfwnmlbr.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3500, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'', CAST(N'2024-04-22T18:58:26.5412472' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787129/wmojroh7fln7gy20gss3.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3501, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đasd', CAST(N'2024-04-22T19:01:38.9234854' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787323/l8dykqyrvarlu4apqgjd.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3502, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'', CAST(N'2024-04-22T19:06:02.8831682' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3503, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'gfgf', CAST(N'2024-04-22T19:06:20.6348104' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3504, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'adsdasd', CAST(N'2024-04-22T19:07:42.2123687' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787687/fdazeoaeejs05e82ac6q.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3505, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'đâsd', CAST(N'2024-04-22T19:07:53.0045097' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3506, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123123', CAST(N'2024-04-22T19:08:01.4747043' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787704/pwfffa4fwpjtdkqowj1b.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3507, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdsaddasddasd', CAST(N'2024-04-22T19:12:21.1027612' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713787965/uyjxadeeeleh9vacmeap.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3508, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đâsd', CAST(N'2024-04-22T19:14:46.0901391' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713788110/iqyqybtksungisxcfdmz.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3509, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đâs', CAST(N'2024-04-22T19:15:39.4814140' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3510, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'adsdasd', CAST(N'2024-04-22T19:15:53.2205614' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713788176/jr1ewtmiaaatofdecp2i.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3511, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đasad', CAST(N'2024-04-22T19:16:34.6741284' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713788217/d7nrdpxjhcpwtplfkmyy.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3512, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-22T21:13:13.9839987' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713795219/er3tg7cflqrulj801jm2.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3513, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fsdfsdf', CAST(N'2024-04-22T21:13:23.2591883' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3514, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dasdasd', CAST(N'2024-04-22T21:13:42.9178065' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1713795246/yhw2xijibbib5fm55iur.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3515, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T21:42:43.9092795' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3516, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:14:16.1115796' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3517, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:15:47.0476109' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714058174/ewjxa0ntmikdddqjqvgh.png')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3518, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:19:31.5350787' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714058400/j1icaxyypzwie33a7axi.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3519, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:20:31.8410208' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714058458/aqzbpgd8y7dwnu7xef7y.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3520, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:21:07.3902373' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714058493/gjwbsganhnjdh77ppxw4.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3521, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:29:54.0981057' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714059020/ia8diuzaxnwgamqigbwm.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3522, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:31:03.0974823' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714059089/hh3v0o3b0vi9y9e9nek4.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3523, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:33:53.8083090' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714059259/wkhoosjk14rffncyglc2.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3524, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-04-25T22:34:07.2412031' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714059273/x5cgerlpflfquyk7odvi.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3525, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fdfg', CAST(N'2024-04-25T22:38:26.4671994' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3526, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fsfd', CAST(N'2024-04-25T22:41:09.5827773' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3527, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dá', CAST(N'2024-04-25T22:42:34.1849623' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3528, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'đá', CAST(N'2024-04-25T22:45:33.0208493' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3529, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'đá', CAST(N'2024-04-25T22:48:32.8146145' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714060139/fqxfewir1ltzpibzqszr.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3530, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'dalsndajsndjansdjkansjdknasjd das d


 dasd asd


 dasd', CAST(N'2024-04-30T16:25:05.9832414' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3531, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-05-01T09:13:00.4056506' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1714529612/k62s2stfynicyrfwpetm.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3532, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'gui hinh ne', CAST(N'2024-05-01T09:13:13.2197890' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3533, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123', CAST(N'2024-05-03T08:11:20.6777336' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3534, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123', CAST(N'2024-05-03T08:11:20.6665038' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3535, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'eqwe', CAST(N'2024-05-03T08:13:23.4239197' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3536, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'eqwe', CAST(N'2024-05-03T08:13:23.4274957' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3537, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123123', CAST(N'2024-05-03T08:14:29.0071967' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3538, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123123', CAST(N'2024-05-03T08:14:29.0388778' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3539, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'asdasd', CAST(N'2024-05-03T08:19:39.8921874' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3540, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-05-03T23:36:38.8264124' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3541, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123', CAST(N'2024-05-07T20:25:40.4645783' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3542, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'adsdasd', CAST(N'2024-05-07T20:25:44.7584516' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3543, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-05-07T20:25:50.7228708' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715088390/isjxcctezdieak9nx5ud.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3544, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'', CAST(N'2024-05-10T19:02:31.2838278' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715342597/pwdcmfonbklksvotl5js.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3545, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'demo chat khóa luận', CAST(N'2024-05-12T12:03:58.6618501' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1715490289/g65bdadbujas5l7vywyb.png')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3546, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chat', CAST(N'2024-05-13T16:48:45.6833460' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3547, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo', CAST(N'2024-05-14T20:56:52.4788039' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3548, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'test', CAST(N'2024-05-14T20:56:58.0060268' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3549, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chao', CAST(N'2024-05-17T01:05:12.2771963' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3550, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'hello', CAST(N'2024-05-17T01:05:24.6127575' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3551, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123123123', CAST(N'2024-06-03T00:19:00.5068801' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3552, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'tesst chat', CAST(N'2024-06-04T01:45:54.8680188' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1717440368/hypumht801sqjosxzh3t.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3553, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'demo chat', CAST(N'2024-06-08T08:58:17.9963926' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3554, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123', CAST(N'2024-06-08T09:00:28.8023297' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3555, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo', CAST(N'2024-06-08T09:00:44.2736061' AS DateTime2), NULL)
GO
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3556, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo chat 123', CAST(N'2024-06-08T09:02:09.3913966' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3557, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'123', CAST(N'2024-06-08T09:08:15.5801623' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3558, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chat demo', CAST(N'2024-06-08T09:09:12.3967101' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3559, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chat và gửi ảnh ', CAST(N'2024-06-08T09:09:44.3042860' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1717812601/ivikrgkd936pzurhwhlq.jpg')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3560, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'123', CAST(N'2024-06-08T09:10:50.5773444' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3561, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo chat ', CAST(N'2024-06-08T09:14:41.3042072' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3562, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'chat va gui hinh anh', CAST(N'2024-06-08T09:15:10.1813974' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1717812925/wmakknho7xvexklfqtni.png')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3563, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'chat mini', CAST(N'2024-06-08T09:15:35.3614606' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3564, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo chat mini', CAST(N'2024-06-08T09:15:40.8518985' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3565, N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'xin chao', CAST(N'2024-06-13T12:57:26.7416377' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3566, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'chao nha', CAST(N'2024-06-13T12:57:31.2432959' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3567, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'123', CAST(N'2024-06-13T12:57:34.0147347' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3568, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'son', CAST(N'2024-06-13T12:58:50.4489938' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1718258357/ifhxw3rdmkszn9osi4th.png')
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3569, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'12313', CAST(N'2024-06-14T21:24:56.1068829' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3570, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', N'dsdasd', CAST(N'2024-06-14T21:25:04.3708665' AS DateTime2), NULL)
INSERT [dbo].[ChatPrivate] ([ChatPrivateId], [SenderUserId], [ReceiverUserId], [Message], [NotificationDateTime], [ImageChat]) VALUES (3571, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'a733eed2-a179-4aa1-9624-3885a129c89b', N'123', CAST(N'2024-06-14T21:32:27.7943250' AS DateTime2), N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1718375567/mvabtko0aszxqk4jqjgp.jpg')
SET IDENTITY_INSERT [dbo].[ChatPrivate] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatRoom] ON 

INSERT [dbo].[ChatRoom] ([Id], [Name]) VALUES (1082, N'group chat 123')
SET IDENTITY_INSERT [dbo].[ChatRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Code] ON 

INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (4003, N'HUCLH65PQSK47FW', 50, CAST(N'2024-06-06T16:05:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (5003, N'YZ9S0IL9I2X0MP5', 15, CAST(N'2023-11-18T20:08:00.0000000' AS DateTime2), 13)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (5004, N'4XJ6EWJWNQCL8JW', 5, CAST(N'2025-11-21T20:09:00.0000000' AS DateTime2), 78)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (6003, N'696Y83IJ7NT66TG', 8, CAST(N'2024-02-24T21:19:00.0000000' AS DateTime2), 177)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (7003, N'2W7EO815MP3E5I9', 30, CAST(N'2023-10-27T16:09:00.0000000' AS DateTime2), 98)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (8003, N'XR2MFQP1OMXYOWO', 35, CAST(N'2023-10-27T10:15:00.0000000' AS DateTime2), 993)
SET IDENTITY_INSERT [dbo].[Code] OFF
GO
SET IDENTITY_INSERT [dbo].[ComboMenuEntity] ON 

INSERT [dbo].[ComboMenuEntity] ([ComboMenuId], [Name], [ComboPrice]) VALUES (1, N'combo gia đình dui dẻ', 300000)
INSERT [dbo].[ComboMenuEntity] ([ComboMenuId], [Name], [ComboPrice]) VALUES (2, N'combo vip pro', 10000000)
INSERT [dbo].[ComboMenuEntity] ([ComboMenuId], [Name], [ComboPrice]) VALUES (3, N'combo ngày đặc biệt', 9999999)
SET IDENTITY_INSERT [dbo].[ComboMenuEntity] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Mobile], [Email], [Address], [Avatar]) VALUES (1, N'lee', N'sin', N'0123123', N'bacthaysongam@gmail.com', N'', N'')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (6, N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3', CAST(N'2023-09-11T13:47:00.0000000' AS DateTime2), N'chắc có mình tui thấy cũng ok mà', 4, 1002)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2004, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:05:50.8177901' AS DateTime2), N'hehe', 4, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2005, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:08:06.2415594' AS DateTime2), N'hehe', 4, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2006, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:08:41.9651625' AS DateTime2), N'hehe', 4, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2012, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:28:29.3961181' AS DateTime2), N'test rating', 3, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2013, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:28:43.8191858' AS DateTime2), N'test rating', 3, 1002)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2014, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:36:09.5532913' AS DateTime2), N'test rating', 2.5, 3)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2015, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:37:47.6134916' AS DateTime2), N'test rating', 2.5, 3)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2016, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:37:59.8020950' AS DateTime2), N'test rating', 3.5, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2017, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:38:09.2721885' AS DateTime2), N'test rating', 5, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2018, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:38:44.2160313' AS DateTime2), N'test rating', 1, 1002)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2019, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T06:38:47.5166748' AS DateTime2), N'test rating', 1, 1002)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2020, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T10:42:32.1516719' AS DateTime2), N'dasdsdsaddddddddddddddddddddddddddddddddddddddddddddasdasdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsdsdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd', 2.5, 3)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2022, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2023-10-18T12:25:14.2685022' AS DateTime2), N':>', 0, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2023, N'a733eed2-a179-4aa1-9624-3885a129c89b', CAST(N'2024-06-03T23:35:57.4724917' AS DateTime2), N'qweqweqwe
', 0, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2024, N'a733eed2-a179-4aa1-9624-3885a129c89b', CAST(N'2024-06-03T23:39:09.4363920' AS DateTime2), N'
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d ', 0, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2025, N'a733eed2-a179-4aa1-9624-3885a129c89b', CAST(N'2024-06-03T23:40:07.8593451' AS DateTime2), N'
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d 
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d 
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d ', 0, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2026, N'a733eed2-a179-4aa1-9624-3885a129c89b', CAST(N'2024-06-03T23:40:20.8137559' AS DateTime2), N'
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d 
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d 
dasdlkajsidhishdoias8da s8uda8su dausd 8aus8d ya7s yd7asy d7ays7dya8 dyas89 dyuas98d uasod uaosid aois udoaisud oas das das das das d ', 4, 1002)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2027, N'a733eed2-a179-4aa1-9624-3885a129c89b', CAST(N'2024-06-04T00:25:25.0774569' AS DateTime2), N'đâsdasdasdasdadasdasdasd', 3, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2028, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2024-06-04T15:26:27.3436742' AS DateTime2), N'aaaaaaaaaaaaaaaaaaa', 0, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2029, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2024-06-04T15:44:24.6877288' AS DateTime2), N'aaaaaaaaaaaaa', 0, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2030, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', CAST(N'2024-06-04T15:44:31.5451110' AS DateTime2), N'aaaaaaaaaaaaa', 4, 2)
INSERT [dbo].[Feedback] ([FeedbackId], [UserId], [FeedbackDate], [Content], [Rating], [BranchId]) VALUES (2031, N'a733eed2-a179-4aa1-9624-3885a129c89b', CAST(N'2024-06-04T17:55:47.2601796' AS DateTime2), N'phản hồi
', 4, 2)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Hall] ON 

INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (1, N'sảnh 1', N'Thực đơn đa dạng, phù hợp mọi khẩu vị', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696882791/ognzfvrpzff5uji4jpbq.jpg', 3, 200, 50000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (2, N'sảnh thứ 2', N'Giá cả hợp lý, phù hợp với ngân sách', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696882983/e8o7yah0ahoqucmjxzfu.jpg', 2, 300, 60000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (1002, N'sảnh 4', N'Trang trí tinh tế, không gian rộng rãi.', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696883008/wwmjobae0ysp8c11yd9n.jpg', 2, 450, 70000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (2002, N'sảnh 3', N'1123', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697898782/vchmscy5ifrthdqjqv51.jpg', 2, 550, 80000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (2005, N'Sảnh 5', N'aaaaaaaaaa', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1717493543/wtlapkw1e6ipdzohod03.jpg', 3, 280, 65000000)
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24057, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2024-05-11T19:55:38.8155264' AS DateTime2), CAST(N'2027-05-20T12:54:55.0000000' AS DateTime2), 359849400, N'minh tai', N'1231', N'0795896039', 413620000, 1, N'Đã hủy đơn hàng', NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24058, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2, CAST(N'2024-05-11T19:59:02.5228401' AS DateTime2), CAST(N'2029-05-23T12:58:21.0000000' AS DateTime2), 79541360, N'minh tai', N'1234', N'0795896039', 86458000, 1, N'Đã hủy đơn hàng', NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24060, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-13T02:33:02.4433934' AS DateTime2), CAST(N'2024-06-05T19:31:45.0000000' AS DateTime2), 829288000, N'minh tai', N'123', N'0795896039', 901400000, 1, N'Đã hủy đơn hàng', NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24061, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-05-18T11:58:12.5896919' AS DateTime2), CAST(N'2024-07-27T04:57:22.0000000' AS DateTime2), 904200000, N'minh tai', N'', N'0795896039', 904200000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24062, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-05-29T00:01:46.0372456' AS DateTime2), CAST(N'2024-08-19T17:00:48.0000000' AS DateTime2), 451369000, N'123', N'123', N'0795896039', 902738000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24063, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-05-29T00:05:54.5403438' AS DateTime2), CAST(N'2024-08-14T17:02:02.0000000' AS DateTime2), 900218000, N'123123', N'123', N'0795896039', 900218000, 1, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24064, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-02T19:11:03.2875754' AS DateTime2), CAST(N'2024-10-03T12:06:37.0000000' AS DateTime2), 81700000, N'123', N'123123', N'0795896039', 81700000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24065, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-02T19:11:45.6160186' AS DateTime2), CAST(N'2024-10-04T12:11:15.0000000' AS DateTime2), 913568000, N'123', N'12213', N'0795896039', 913568000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24066, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-02T19:12:25.8101763' AS DateTime2), CAST(N'2024-10-05T12:11:15.0000000' AS DateTime2), 913568000, N'123', N'12213', N'0795896039', 913568000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24067, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-02T19:14:40.4715474' AS DateTime2), CAST(N'2024-10-06T12:11:15.0000000' AS DateTime2), 913568000, N'123', N'12213', N'0795896039', 913568000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24068, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-02T19:14:54.3961565' AS DateTime2), CAST(N'2024-10-07T12:11:15.0000000' AS DateTime2), 913568000, N'123', N'12213', N'0795896039', 913568000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24069, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-02T19:16:50.1073351' AS DateTime2), CAST(N'2024-10-08T12:11:15.0000000' AS DateTime2), 913568000, N'123', N'12213', N'0795896039', 913568000, 0, NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24070, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-02T19:17:14.2438159' AS DateTime2), CAST(N'2024-10-09T12:11:15.0000000' AS DateTime2), 913568000, N'123', N'12213', N'0795896039', 913568000, 0, N'Đã hủy đơn hàng', NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24072, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-02T23:19:49.0837124' AS DateTime2), CAST(N'2024-11-12T16:18:19.0000000' AS DateTime2), 81218000, N'21312', N'123123', N'0795896039', 81218000, 0, NULL, N'Ca tối: 19am - 23am', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24073, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-04T00:50:08.0838134' AS DateTime2), CAST(N'2024-11-18T17:48:26.0000000' AS DateTime2), 901218000, N'21312', N'', N'0795896039', 901218000, 0, NULL, N'Ca tối: 312inhtai', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24074, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-04T00:52:01.5550931' AS DateTime2), CAST(N'2025-06-03T17:00:00.0000000' AS DateTime2), 901218000, N'21312', N'', N'0795896039', 901218000, 0, NULL, N'Ca tối: 312inhtai', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24076, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-04T00:57:18.7918768' AS DateTime2), CAST(N'2025-05-31T17:56:40.0000000' AS DateTime2), 80218000, N'12312', N'123', N'0795896039', 80218000, 0, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24077, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-04T01:00:11.5521201' AS DateTime2), CAST(N'2025-06-01T17:59:44.0000000' AS DateTime2), 81538000, N'123', N'', N'0795896039', 81538000, 0, NULL, N'Ca chiều: 13h - 18h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24078, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-04T01:02:47.4215249' AS DateTime2), CAST(N'2025-05-07T17:59:44.0000000' AS DateTime2), 81538000, N'123', N'', N'0795896039', 81538000, 0, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24079, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-04T01:07:12.4664015' AS DateTime2), CAST(N'2025-01-03T18:06:36.0000000' AS DateTime2), 83380000, N'123', N'2313', N'0795896039', 83380000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24080, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-06-04T15:04:48.8163530' AS DateTime2), CAST(N'2024-08-21T08:00:04.0000000' AS DateTime2), 67307500, N'aaaa', N'aaa', N'1234567891', 70850000, 1, N'Đã hủy đơn hàng', N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24081, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-06-04T16:11:20.1447758' AS DateTime2), CAST(N'2024-10-16T09:10:28.0000000' AS DateTime2), 35425000, N'Quan', N'', N'0123456789', 70850000, 0, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (24082, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-04T17:58:25.8258397' AS DateTime2), CAST(N'2024-08-14T10:56:10.0000000' AS DateTime2), 59558650, N'khóa luận', N'ghi chú', N'0795896039', 70069000, 0, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25082, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-16T18:52:13.4286819' AS DateTime2), CAST(N'2025-01-16T11:36:26.0000000' AS DateTime2), 85000000, N'minh tài ', N'note cho nha han', N'0795896039', 85000000, 0, N'Đã hủy đơn hàng', N'Ca tối: 312inhtai', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25083, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T00:36:52.8446568' AS DateTime2), CAST(N'2024-12-19T17:36:31.0000000' AS DateTime2), 85380000, N'minh tài 12312312 312 ', N'note cho nha han123 1231', N'0795896033', 85380000, 0, N'Đã hủy đơn hàng', N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25084, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T00:45:27.8822135' AS DateTime2), CAST(N'2024-12-20T17:36:31.0000000' AS DateTime2), 85380000, N'minh tài 12312312 312 ', N'note cho nha han123 1231', N'0795896033', 85380000, 0, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25085, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:03:48.4571823' AS DateTime2), CAST(N'2024-12-23T17:36:31.0000000' AS DateTime2), 89380000, N'minh tài 12 ', N'note cho nha han123 1231', N'0795896033', 89380000, 0, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25086, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:03:48.4571862' AS DateTime2), CAST(N'2024-12-23T17:36:31.0000000' AS DateTime2), 89380000, N'minh tài 12 ', N'note cho nha han123 1231', N'0795896033', 89380000, 1, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25087, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:06:12.9520700' AS DateTime2), CAST(N'2024-12-24T17:36:31.0000000' AS DateTime2), 89380000, N'nguyen minh tai', N'luu local roi', N'0795896033', 89380000, 0, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25088, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:06:12.9520700' AS DateTime2), CAST(N'2024-12-24T17:36:31.0000000' AS DateTime2), 89380000, N'nguyen minh tai', N'luu local roi', N'0795896033', 89380000, 1, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25089, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:09:06.0797848' AS DateTime2), CAST(N'2024-12-31T17:36:31.0000000' AS DateTime2), 44690000, N'tai u soica ', N'luu local ro1232131231212 12 312 31 2', N'0795896039', 89380000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25090, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:09:06.0797848' AS DateTime2), CAST(N'2024-12-31T17:36:31.0000000' AS DateTime2), 44690000, N'tai u soica ', N'luu local ro1232131231212 12 312 31 2', N'0795896039', 89380000, 0, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25091, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:13:35.1108927' AS DateTime2), CAST(N'2025-01-01T17:36:31.0000000' AS DateTime2), 89380000, N'tai u soica timer', N'luu local ro1232131231212 12 312 31 ', N'0795896039', 89380000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25092, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:25:15.2119534' AS DateTime2), CAST(N'2025-01-02T17:36:31.0000000' AS DateTime2), 89380000, N'nguyen minh tai', N'note cho nha han', N'0795896039', 89380000, 1, NULL, N'Ca sáng: 123', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25093, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:26:47.9877860' AS DateTime2), CAST(N'2025-01-03T17:36:31.0000000' AS DateTime2), 89380000, N'nguyen minh ta', N'note cho nha han', N'0795896039', 89380000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25094, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T11:35:48.2791096' AS DateTime2), CAST(N'2025-01-04T17:36:31.0000000' AS DateTime2), 24132600, N'nguyen minh tai', N'note cho nha hang', N'0795896039', 89380000, 0, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25095, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T12:18:44.7882168' AS DateTime2), CAST(N'2025-01-05T17:36:31.0000000' AS DateTime2), 89830000, N'nguyen minh tai', N'note cho nha hang', N'0795896039', 89830000, 0, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25096, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T12:19:57.6069845' AS DateTime2), CAST(N'2025-01-06T17:36:31.0000000' AS DateTime2), 89830000, N'nguyen minh tai', N'note cho nha hang', N'0795896039', 89830000, 0, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25097, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T12:56:45.5990086' AS DateTime2), CAST(N'2025-01-15T17:36:31.0000000' AS DateTime2), 80830000, N'nguyen minh tai 123213123', N'note cho nha hang', N'0795896039', 80830000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25098, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T13:11:26.9815250' AS DateTime2), CAST(N'2025-01-30T17:00:00.0000000' AS DateTime2), 28290500, N'nguyen minh tai 123213123 31/5', N'note cho nha hang', N'0795896039', 80830000, 1, NULL, N'Ca tối: 312inhtai', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25099, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T13:17:21.1367042' AS DateTime2), CAST(N'2025-01-29T00:00:00.0000000' AS DateTime2), 80830000, N'nguyen minh tai 123213123 31/5', N'note cho nha hang', N'0795896039', 80830000, 1, NULL, N'Ca tối: 312inhtai', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25100, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-17T13:31:30.1282709' AS DateTime2), CAST(N'2025-01-21T00:00:00.0000000' AS DateTime2), 80830000, N'nguyen minh tai 123213123 29/1/2025', N'note cho nha hang', N'0795896039', 80830000, 1, NULL, N'Ca tối: 312inhtai', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25101, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-17T13:32:54.3705269' AS DateTime2), CAST(N'2025-01-21T00:00:00.0000000' AS DateTime2), 70830000, N'nguyen minh tai 123213123 29/1/2025', N'note cho nha hang', N'0795896039', 70830000, 1, NULL, N'Ca tối: 19h - 23h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25102, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-17T13:36:56.5678408' AS DateTime2), CAST(N'2025-01-22T00:00:00.0000000' AS DateTime2), 70929000, N'nguyen minh tai', N'note cho nha hang 22/01/2025', N'0795896039', 70929000, 1, N'Đã hủy đơn hàng', N'Ca tối: 19h - 23h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25103, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-17T17:36:33.5533406' AS DateTime2), CAST(N'2025-01-07T00:00:00.0000000' AS DateTime2), 70929000, N'nguyen minh tai', N'note cho nha hang 22/01/2025', N'0795896039', 70929000, 1, N'Đã hủy đơn hàng', N'Ca tối: 19h - 23h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25104, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-17T18:58:20.0814415' AS DateTime2), CAST(N'2025-01-06T00:00:00.0000000' AS DateTime2), 70929000, N'nguyen minh tai', N'note cho nha hang 22/01/2025', N'0795896039', 70929000, 1, N'Đã hủy đơn hàng', N'Ca tối: 19h - 23h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25105, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-17T21:33:07.4064416' AS DateTime2), CAST(N'2025-01-05T00:00:00.0000000' AS DateTime2), 70929000, N'nguyen minh tai', N'note cho nha hang 22/01/2025', N'0795896039', 70929000, 1, N'Đã hủy đơn hàng', N'Ca tối: 19h - 23h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25106, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T09:15:51.3857995' AS DateTime2), CAST(N'2025-01-12T00:00:00.0000000' AS DateTime2), 80929000, N'nguyen minh tai', N'note cho nha hang 22/01/2025', N'0795896039', 80929000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25107, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T13:02:41.2794859' AS DateTime2), CAST(N'2025-02-18T00:00:00.0000000' AS DateTime2), 81199000, N'nguyen minh tai', N'note cho nha hang them param', N'0795896039', 81199000, 1, NULL, N'Ca tối: 312inhtai', 0)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25108, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T13:07:04.7416444' AS DateTime2), CAST(N'2025-02-19T00:00:00.0000000' AS DateTime2), 81199000, N'nguyen minh tai', N'note cho nha hang them param wallet', N'0795896039', 81199000, 1, NULL, N'Ca tối: 312inhtai', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25109, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T13:11:52.9924622' AS DateTime2), CAST(N'2025-02-20T00:00:00.0000000' AS DateTime2), 81199000, N'nguyen minh tai', N'note cho nha hang them param wallet', N'0795896039', 81199000, 1, N'Đã hủy đơn hàng', N'Ca tối: 312inhtai', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25110, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2, CAST(N'2024-06-18T13:14:23.7692332' AS DateTime2), CAST(N'2025-02-21T00:00:00.0000000' AS DateTime2), 34899500, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, NULL, N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25111, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:15:33.5148373' AS DateTime2), CAST(N'2025-02-22T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25112, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:17:10.1601549' AS DateTime2), CAST(N'2025-02-23T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25113, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:18:23.4974083' AS DateTime2), CAST(N'2025-02-24T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, NULL, N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25114, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:21:46.7551837' AS DateTime2), CAST(N'2025-02-25T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25115, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:22:06.3427227' AS DateTime2), CAST(N'2025-02-26T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25116, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:25:52.8542667' AS DateTime2), CAST(N'2025-02-27T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25117, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:27:18.2462720' AS DateTime2), CAST(N'2025-02-28T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25118, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:28:32.4826326' AS DateTime2), CAST(N'2025-03-01T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25119, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:29:13.2646514' AS DateTime2), CAST(N'2025-03-02T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25120, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:30:31.2754411' AS DateTime2), CAST(N'2025-03-03T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25121, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:40:01.5807944' AS DateTime2), CAST(N'2025-03-04T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, NULL, N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25122, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:40:15.0479035' AS DateTime2), CAST(N'2025-03-05T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, NULL, N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25123, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:40:25.2778245' AS DateTime2), CAST(N'2025-03-06T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25124, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:40:37.4431866' AS DateTime2), CAST(N'2025-03-07T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25125, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2, CAST(N'2024-06-18T13:43:20.6856480' AS DateTime2), CAST(N'2025-03-08T00:00:00.0000000' AS DateTime2), 69799000, N'dua con cua gio', N'note cho nha hang them param wallet', N'0795896039', 69799000, 1, NULL, N'Ca chiều: 13h - 18h', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25126, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T22:34:33.8579587' AS DateTime2), CAST(N'2025-03-10T00:00:00.0000000' AS DateTime2), 71550000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 71550000, 1, NULL, N'Ca chiều: 13h - 18h', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25127, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T22:37:18.6836373' AS DateTime2), CAST(N'2025-03-11T00:00:00.0000000' AS DateTime2), 73250000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 73250000, 1, N'Đã hủy đơn hàng', N'Ca chiều: 12321', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25128, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T22:39:16.6680891' AS DateTime2), CAST(N'2025-03-12T00:00:00.0000000' AS DateTime2), 73250000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 73250000, 1, NULL, N'Ca chiều: 12321', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25129, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T22:41:09.1198836' AS DateTime2), CAST(N'2025-03-13T00:00:00.0000000' AS DateTime2), 73250000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 73250000, 1, NULL, N'Ca chiều: 12321', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25130, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2002, CAST(N'2024-06-18T22:42:53.4760254' AS DateTime2), CAST(N'2025-03-14T00:00:00.0000000' AS DateTime2), 83250000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 83250000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25131, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2002, CAST(N'2024-06-18T22:45:25.8891244' AS DateTime2), CAST(N'2025-03-15T00:00:00.0000000' AS DateTime2), 83250000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 83250000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25132, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2002, CAST(N'2024-06-18T22:45:48.1820280' AS DateTime2), CAST(N'2025-03-16T00:00:00.0000000' AS DateTime2), 83250000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 83250000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25133, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T23:01:48.8716060' AS DateTime2), CAST(N'2025-03-17T00:00:00.0000000' AS DateTime2), 73370000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 73370000, 1, N'Đã hủy đơn hàng', N'Ca tối: 3', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25134, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T23:23:31.0232928' AS DateTime2), CAST(N'2025-03-18T00:00:00.0000000' AS DateTime2), 73370000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 73370000, 1, N'Đã hủy đơn hàng', N'Ca tối: 3', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25135, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T23:51:20.2037906' AS DateTime2), CAST(N'2025-03-19T00:00:00.0000000' AS DateTime2), 73370000, N'dua con cua gio 123', N'note cho nha hang them param wallet', N'0795896039', 73370000, 1, NULL, N'Ca chiều: 12321', 1)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25136, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T23:54:52.2206239' AS DateTime2), CAST(N'2025-03-20T00:00:00.0000000' AS DateTime2), 73370000, N'dua con cua gio 123 12312 312 3 ', N'note cho nha hang them param wallet', N'0795896039', 73370000, 1, NULL, N'Ca chiều: 12321', NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus], [TimeHall], [PaymentWallet]) VALUES (25137, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-06-18T23:59:02.6733753' AS DateTime2), CAST(N'2025-03-21T00:00:00.0000000' AS DateTime2), 73370000, N'dua con cua gio 123 12312 312 3 ', N'note cho nha hang them param wallet', N'0795896039', 73370000, 1, NULL, N'Ca chiều: 12321', NULL)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceCode] ON 

INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8030, 24057, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8031, 24057, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8032, 24058, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8034, 24060, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8035, 24062, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8036, 24080, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8037, 24081, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8038, 24082, 5003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9038, 25090, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9039, 25089, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9040, 25094, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9041, 25094, 5003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9042, 25094, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9043, 25098, 5003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9044, 25098, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (9045, 25110, 4003)
SET IDENTITY_INSERT [dbo].[InvoiceCode] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuCategory] ON 

INSERT [dbo].[MenuCategory] ([CategoryId], [Name], [Description]) VALUES (1, N'món khai vị', N'ngon')
INSERT [dbo].[MenuCategory] ([CategoryId], [Name], [Description]) VALUES (2, N'món chính', N'no lắm nha')
INSERT [dbo].[MenuCategory] ([CategoryId], [Name], [Description]) VALUES (1002, N'món tráng miệng', N'ngon')
INSERT [dbo].[MenuCategory] ([CategoryId], [Name], [Description]) VALUES (1003, N'món ăn vặt', N'con nít gất iu')
INSERT [dbo].[MenuCategory] ([CategoryId], [Name], [Description]) VALUES (1004, N'nước uống', N'mát lạnh')
INSERT [dbo].[MenuCategory] ([CategoryId], [Name], [Description]) VALUES (2003, N'món chay', N'thanh tịnh')
SET IDENTITY_INSERT [dbo].[MenuCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuEntity] ON 

INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (1, N'Gỏi ngó sen', 150000, N'chua chua ngọt ngọt', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697897801/ksje0ljhxjodwqxstrzp.avif')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (2, N'Gà nướng muối ớt', 550000, N'cay the the', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695780160/iabwci36lwdkknyoq8wp.webp')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3, N'Gỏi tôm với cổ hủ dừa', 180000, N'dòn dòn', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695780331/wjekau3rbzkclqf9pf2m.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4, N'Gà bó xôi', 20000, N'mềm chiên dòn', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695779804/ixwrxvecrmhhxylcfz24.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (2002, N'tàu hủ nước đường', 20000, N'ngọt ngọt có gừng', 1002, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695779822/se1vxj5xk7wahyejmrse.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3002, N'lẩu thái chua cay', 650000, N'chua chua cay cay', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695700316/cnqfdr3ztcb9hgxy29j5.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3003, N'cơm tấm lankmark 81', 200000, N'ngon mà đắt quá', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696914902/xwzkmrsnhb0io1crj3sy.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3004, N'cơm chiên dương châu', 180000, N'cơm chiên mềm xốp', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696914992/mklusfkirfwlm9pxpw1m.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4003, N'tôm hùm alaska', 4000000, N'ngon lắm nha', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697885197/mwumokag8gp6xnqhjzcq.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4004, N'khoai tây chiên', 30000, N'dòn ngon', 1003, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697885399/ttyjxuhwrudskwpcgtec.png')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4005, N'trà sữa', 40000, N'béo béo', 1004, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697885538/l7kin2sgj6mvlaydbi2l.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4006, N'chè thái miền tây', 20000, N'ngọt ngọt có nhiều topping', 1002, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697885631/b5rkm6xkwrzm3iemievp.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4007, N'bánh plan', 20000, N'có cà phê đắng đắng', 1002, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697885761/wgh7zkyt1qgsjkjbqeb2.webp')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5004, N'tôm chiên bột đó nhe', 120000, N'dòn dòn', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697899982/jpevz2xerfwgofjnv63v.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5005, N'bánh đúc nước cốt dừa', 80000, N'ngọt ngọt nước cốt dừa', 1002, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900078/ei4m2afuplrtjqu0gpq2.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5006, N'đậu hũ xốt cà chua', 120000, N'món chay', 2003, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900321/qz3uxcfisinpw5xtzdai.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5007, N'bò kho chay', 250000, N'món chay', 2003, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900359/ha08lwku92vitbplomei.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5008, N'đậu hũ chiên xả', 70000, N'chay', 2003, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900409/gxvx1q48hhdt4t4cjynv.png')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5012, N'hồng trà trái cây', 59000, N'mát ngon', 1004, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900828/cvizjglqdworwvnp1lbr.webp')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5013, N'đồ ăn vặt bà tuyết', 180000, N'ăn vặt', 1003, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900895/qtyw012i10krcezg24bg.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (5014, N'nước trái cây', 79000, N'mát ngọt', 1004, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697900997/u1yobv5bukcuzuoweitj.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (6003, N'vịt quay bắc kinh', 3000000, N'chời ơi ngon !', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1698144693/g02nwtyhqbn24cwumtq3.jpg')
SET IDENTITY_INSERT [dbo].[MenuEntity] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItemComboMenu] ON 

INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (1, 1, 1)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (7, 3003, 1)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (10, 1, 1)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (11, 3002, 1)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (12, 3003, 1)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (1002, 3003, 2)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (1003, 3004, 2)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (2002, 2, 3)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (2003, 3004, 3)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (2004, 4003, 3)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (2005, 5012, 3)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (2006, 5013, 3)
INSERT [dbo].[MenuItemComboMenu] ([MenuItemComboMenuId], [MenuId], [ComboMenuId]) VALUES (2007, 6003, 3)
SET IDENTITY_INSERT [dbo].[MenuItemComboMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3286, N' đã xóa', N'All', CAST(N'2024-05-10T10:37:03.9415576' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3287, N' đã xóa chi nhánh', N'All', CAST(N'2024-05-12T09:45:21.5656625' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3288, N'  thêm chi nhánh mới', N'All', CAST(N'2024-05-12T09:47:40.6544754' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3289, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-05-12T09:47:47.3115086' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3290, N' đã xóa chi nhánh', N'All', CAST(N'2024-05-12T09:54:39.9795063' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3291, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-05-12T11:53:12.9382789' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3292, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-05-16T12:05:57.7206826' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3293, N'  thêm chi nhánh mới', N'All', CAST(N'2024-05-16T23:27:10.3830044' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3294, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-05-16T23:27:16.0828739' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3295, N' đã xóa chi nhánh', N'All', CAST(N'2024-05-16T23:27:19.8896465' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3296, N'  thêm sảnh mới', N'All', CAST(N'2024-06-02T12:42:11.7153339' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3297, N' đã xóa', N'All', CAST(N'2024-06-02T12:42:15.0791362' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3298, N'  thêm sảnh mới', N'All', CAST(N'2024-06-02T18:18:08.3658048' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3299, N' đã xóa', N'All', CAST(N'2024-06-02T18:18:19.1966257' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3300, N'  thêm sảnh mới', N'All', CAST(N'2024-06-02T18:22:42.3592289' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3301, N' đã xóa', N'All', CAST(N'2024-06-02T18:29:06.3640365' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3302, N'  thêm sảnh mới', N'All', CAST(N'2024-06-02T18:30:49.9339478' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3303, N' đã xóa', N'All', CAST(N'2024-06-02T18:31:10.7401142' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3304, N'  thêm sảnh mới', N'All', CAST(N'2024-06-03T00:13:43.3668433' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3305, N' đã xóa', N'All', CAST(N'2024-06-03T00:13:54.1172396' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3306, N'  thêm chi nhánh mới', N'All', CAST(N'2024-06-04T01:39:21.3135388' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3307, N'  thêm chi nhánh mới', N'All', CAST(N'2024-06-04T01:39:52.0253553' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3308, N' đã xóa chi nhánh', N'All', CAST(N'2024-06-04T01:40:10.4619463' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3309, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:48:43.5076218' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3310, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:49:00.5114941' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3311, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:49:08.9296686' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3312, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:49:13.3311922' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3313, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:49:20.7059580' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3314, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:49:34.1296083' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3315, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:50:11.4964525' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3316, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:50:17.9339799' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3317, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:50:34.4986538' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3318, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:50:42.6984917' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3319, N' đã cập nhật ', N'All', CAST(N'2024-06-04T01:50:50.4862725' AS DateTime2), N'a1bf4a97-6196-416c-b55f-07ddc41ab715')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3320, N' đã xóa chi nhánh', N'All', CAST(N'2024-06-04T01:51:32.8081291' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3321, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-06-04T15:29:44.7518043' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3322, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-06-04T15:32:33.3351686' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3323, N' đã cập nhật chi nhánh', N'All', CAST(N'2024-06-04T15:32:59.6804285' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3324, N' đã cập nhật ', N'All', CAST(N'2024-06-04T15:46:55.2492205' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3325, N' đã cập nhật ', N'All', CAST(N'2024-06-04T15:47:14.8411200' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3326, N' đã cập nhật ', N'All', CAST(N'2024-06-04T15:47:24.4570673' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3327, N' đã xóa chi nhánh', N'All', CAST(N'2024-06-04T16:22:08.7332261' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3328, N'  thêm chi nhánh mới', N'All', CAST(N'2024-06-04T16:23:02.4984073' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3329, N'  thêm chi nhánh mới', N'All', CAST(N'2024-06-04T16:29:07.8705297' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3330, N' đã xóa chi nhánh', N'All', CAST(N'2024-06-04T16:29:23.6731482' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3331, N'  thêm sảnh mới', N'All', CAST(N'2024-06-04T16:32:24.0421077' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[Notification] ([Id], [Message], [MessageType], [NotificationDateTime], [UserId]) VALUES (3332, N' đã cập nhật ', N'All', CAST(N'2024-06-14T20:59:57.1162557' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderMenu] ON 

INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23127, 24057, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23128, 24057, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23129, 24057, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23130, 24057, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23131, 24057, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23132, 24057, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23133, 24058, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23134, 24058, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23135, 24058, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23136, 24058, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23137, 24058, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23138, 24058, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23139, 24058, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23140, 24058, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23149, 24060, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23150, 24060, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23151, 24060, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23152, 24061, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23153, 24061, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23154, 24061, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23155, 24062, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23156, 24062, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23157, 24062, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23158, 24062, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23159, 24062, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23160, 24063, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23161, 24063, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23162, 24063, 5013)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23163, 24064, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23164, 24064, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23165, 24064, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23166, 24064, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23167, 24064, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23168, 24065, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23169, 24065, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23170, 24065, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23171, 24065, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23172, 24066, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23173, 24066, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23174, 24066, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23175, 24066, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23176, 24067, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23177, 24067, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23178, 24067, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23179, 24067, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23180, 24068, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23181, 24068, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23182, 24068, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23183, 24068, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23184, 24069, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23185, 24069, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23186, 24069, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23187, 24069, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23188, 24070, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23189, 24070, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23190, 24070, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23191, 24070, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23195, 24072, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23196, 24072, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23197, 24072, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23198, 24073, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23199, 24073, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23200, 24073, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23201, 24074, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23202, 24074, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23203, 24074, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23207, 24076, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23208, 24076, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23209, 24076, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23210, 24077, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23211, 24077, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23212, 24077, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23213, 24078, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23214, 24078, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23215, 24078, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23216, 24079, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23217, 24079, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23218, 24079, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23219, 24080, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23220, 24080, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23221, 24080, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23222, 24081, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23223, 24081, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23224, 24081, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23225, 24082, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23226, 24082, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23227, 24082, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23228, 24082, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23229, 24082, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23230, 24082, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23231, 24082, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23232, 24082, 5006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24225, 25082, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24226, 25082, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24227, 25082, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24228, 25082, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24229, 25083, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24230, 25083, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24231, 25083, 3004)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24232, 25083, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24233, 25083, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24234, 25083, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24235, 25083, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24236, 25083, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24237, 25084, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24238, 25084, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24239, 25084, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24240, 25084, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24241, 25084, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24242, 25084, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24243, 25084, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24244, 25084, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24245, 25085, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24246, 25086, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24247, 25085, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24248, 25085, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24249, 25086, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24250, 25086, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24251, 25085, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24252, 25085, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24253, 25086, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24254, 25086, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24255, 25085, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24256, 25085, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24257, 25086, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24258, 25086, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24259, 25085, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24260, 25086, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24261, 25087, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24262, 25087, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24263, 25087, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24264, 25087, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24265, 25087, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24266, 25088, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24267, 25087, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24268, 25087, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24269, 25087, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24270, 25088, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24271, 25088, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24272, 25088, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24273, 25088, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24274, 25088, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24275, 25088, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24276, 25088, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24277, 25090, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24278, 25090, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24279, 25090, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24280, 25090, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24281, 25090, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24282, 25090, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24283, 25090, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24284, 25090, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24285, 25089, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24286, 25089, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24287, 25089, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24288, 25089, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24289, 25089, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24290, 25089, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24291, 25089, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24292, 25089, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24293, 25091, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24294, 25091, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24295, 25091, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24296, 25091, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24297, 25091, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24298, 25091, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24299, 25091, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24300, 25091, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24301, 25092, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24302, 25092, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24303, 25092, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24304, 25092, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24305, 25092, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24306, 25092, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24307, 25092, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24308, 25092, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24309, 25093, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24310, 25093, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24311, 25093, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24312, 25093, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24313, 25093, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24314, 25093, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24315, 25093, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24316, 25093, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24317, 25094, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24318, 25094, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24319, 25094, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24320, 25094, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24321, 25094, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24322, 25094, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24323, 25094, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24324, 25094, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24325, 25095, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24326, 25095, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24327, 25095, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24328, 25095, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24329, 25095, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24330, 25095, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24331, 25095, 4003)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24332, 25095, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24333, 25096, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24334, 25096, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24335, 25096, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24336, 25096, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24337, 25096, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24338, 25096, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24339, 25096, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24340, 25096, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24341, 25097, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24342, 25097, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24343, 25097, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24344, 25097, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24345, 25097, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24346, 25097, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24347, 25097, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24348, 25097, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24349, 25098, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24350, 25098, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24351, 25098, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24352, 25098, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24353, 25098, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24354, 25098, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24355, 25098, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24356, 25098, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24357, 25099, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24358, 25099, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24359, 25099, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24360, 25099, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24361, 25099, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24362, 25099, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24363, 25099, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24364, 25099, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24365, 25100, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24366, 25100, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24367, 25100, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24368, 25100, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24369, 25100, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24370, 25100, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24371, 25100, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24372, 25100, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24373, 25101, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24374, 25101, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24375, 25101, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24376, 25101, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24377, 25101, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24378, 25101, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24379, 25101, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24380, 25101, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24381, 25102, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24382, 25102, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24383, 25102, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24384, 25102, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24385, 25102, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24386, 25102, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24387, 25102, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24388, 25102, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24389, 25102, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24390, 25102, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24391, 25103, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24392, 25103, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24393, 25103, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24394, 25103, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24395, 25103, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24396, 25103, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24397, 25103, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24398, 25103, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24399, 25103, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24400, 25103, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24401, 25104, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24402, 25104, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24403, 25104, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24404, 25104, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24405, 25104, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24406, 25104, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24407, 25104, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24408, 25104, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24409, 25104, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24410, 25104, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24411, 25105, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24412, 25105, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24413, 25105, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24414, 25105, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24415, 25105, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24416, 25105, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24417, 25105, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24418, 25105, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24419, 25105, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24420, 25105, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24421, 25106, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24422, 25106, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24423, 25106, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24424, 25106, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24425, 25106, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24426, 25106, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24427, 25106, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24428, 25106, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24429, 25106, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24430, 25106, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24431, 25107, 5004)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24432, 25107, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24433, 25107, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24434, 25107, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24435, 25107, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24436, 25107, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24437, 25107, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24438, 25107, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24439, 25107, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24440, 25107, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24441, 25107, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24442, 25107, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24443, 25108, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24444, 25108, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24445, 25108, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24446, 25108, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24447, 25108, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24448, 25108, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24449, 25108, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24450, 25108, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24451, 25108, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24452, 25108, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24453, 25108, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24454, 25108, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24455, 25109, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24456, 25109, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24457, 25109, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24458, 25109, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24459, 25109, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24460, 25109, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24461, 25109, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24462, 25109, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24463, 25109, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24464, 25109, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24465, 25109, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24466, 25109, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24467, 25110, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24468, 25110, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24469, 25110, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24470, 25110, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24471, 25110, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24472, 25110, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24473, 25110, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24474, 25110, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24475, 25110, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24476, 25111, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24477, 25111, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24478, 25111, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24479, 25111, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24480, 25111, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24481, 25111, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24482, 25111, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24483, 25111, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24484, 25111, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24485, 25112, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24486, 25112, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24487, 25112, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24488, 25112, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24489, 25112, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24490, 25112, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24491, 25112, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24492, 25112, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24493, 25112, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24494, 25113, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24495, 25113, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24496, 25113, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24497, 25113, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24498, 25113, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24499, 25113, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24500, 25113, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24501, 25113, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24502, 25113, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24503, 25114, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24504, 25114, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24505, 25114, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24506, 25114, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24507, 25114, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24508, 25114, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24509, 25114, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24510, 25114, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24511, 25114, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24512, 25115, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24513, 25115, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24514, 25115, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24515, 25115, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24516, 25115, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24517, 25115, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24518, 25115, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24519, 25115, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24520, 25115, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24521, 25116, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24522, 25116, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24523, 25116, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24524, 25116, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24525, 25116, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24526, 25116, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24527, 25116, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24528, 25116, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24529, 25116, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24530, 25117, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24531, 25117, 4003)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24532, 25117, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24533, 25117, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24534, 25117, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24535, 25117, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24536, 25117, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24537, 25117, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24538, 25117, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24539, 25118, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24540, 25118, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24541, 25118, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24542, 25118, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24543, 25118, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24544, 25118, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24545, 25118, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24546, 25118, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24547, 25118, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24548, 25119, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24549, 25119, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24550, 25119, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24551, 25119, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24552, 25119, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24553, 25119, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24554, 25119, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24555, 25119, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24556, 25119, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24557, 25120, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24558, 25120, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24559, 25120, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24560, 25120, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24561, 25120, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24562, 25120, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24563, 25120, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24564, 25120, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24565, 25120, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24566, 25121, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24567, 25121, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24568, 25121, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24569, 25121, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24570, 25121, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24571, 25121, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24572, 25121, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24573, 25121, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24574, 25121, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24575, 25122, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24576, 25122, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24577, 25122, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24578, 25122, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24579, 25122, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24580, 25122, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24581, 25122, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24582, 25122, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24583, 25122, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24584, 25123, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24585, 25123, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24586, 25123, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24587, 25123, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24588, 25123, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24589, 25123, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24590, 25123, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24591, 25123, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24592, 25123, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24593, 25126, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24594, 25126, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24595, 25126, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24596, 25126, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24597, 25126, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24598, 25127, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24599, 25127, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24600, 25127, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24601, 25127, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24602, 25127, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24603, 25128, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24604, 25128, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24605, 25128, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24606, 25128, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24607, 25128, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24608, 25129, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24609, 25129, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24610, 25129, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24611, 25129, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24612, 25129, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24613, 25130, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24614, 25130, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24615, 25130, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24616, 25130, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24617, 25130, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24618, 25131, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24619, 25131, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24620, 25131, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24621, 25131, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24622, 25131, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24623, 25132, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24624, 25132, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24625, 25132, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24626, 25132, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24627, 25132, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24628, 25133, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24629, 25133, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24630, 25133, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24631, 25133, 2)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24632, 25133, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24633, 25133, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24634, 25134, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24635, 25134, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24636, 25134, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24637, 25134, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24638, 25134, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24639, 25134, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24640, 25135, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24641, 25135, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24642, 25135, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24643, 25135, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24644, 25135, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24645, 25135, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24646, 25136, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24647, 25136, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24648, 25136, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24649, 25136, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24650, 25136, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24651, 25136, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24652, 25137, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24653, 25137, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24654, 25137, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24655, 25137, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24656, 25137, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (24657, 25137, 5004)
SET IDENTITY_INSERT [dbo].[OrderMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18029, 24058, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18030, 24058, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18031, 24080, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18032, 24080, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18033, 24081, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18034, 24081, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18035, 24082, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18036, 24082, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19035, 25082, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19036, 25082, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19037, 25082, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19038, 25082, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19039, 25083, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19040, 25083, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19041, 25083, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19042, 25084, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19043, 25084, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19044, 25084, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19045, 25085, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19046, 25086, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19047, 25085, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19048, 25085, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19049, 25086, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19050, 25086, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19051, 25085, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19052, 25086, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19053, 25087, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19054, 25087, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19055, 25087, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19056, 25087, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19057, 25088, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19058, 25088, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19059, 25088, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19060, 25088, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19061, 25090, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19062, 25089, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19063, 25090, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19064, 25090, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19065, 25089, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19066, 25090, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19067, 25089, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19068, 25089, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19069, 25091, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19070, 25091, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19071, 25091, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19072, 25091, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19073, 25092, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19074, 25092, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19075, 25092, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19076, 25092, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19077, 25093, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19078, 25093, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19079, 25093, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19080, 25093, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19081, 25094, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19082, 25094, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19083, 25094, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19084, 25094, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19085, 25095, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19086, 25095, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19087, 25095, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19088, 25095, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19089, 25095, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19090, 25096, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19091, 25096, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19092, 25096, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19093, 25096, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19094, 25096, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19095, 25097, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19096, 25097, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19097, 25097, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19098, 25098, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19099, 25098, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19100, 25098, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19101, 25099, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19102, 25099, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19103, 25099, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19104, 25100, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19105, 25100, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19106, 25100, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19107, 25101, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19108, 25101, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19109, 25101, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19110, 25102, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19111, 25102, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19112, 25102, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19113, 25103, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19114, 25103, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19115, 25103, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19116, 25104, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19117, 25104, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19118, 25104, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19119, 25105, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19120, 25105, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19121, 25105, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19122, 25106, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19123, 25106, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19124, 25106, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19125, 25107, 5)
GO
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19126, 25107, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19127, 25107, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19128, 25108, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19129, 25108, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19130, 25108, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19131, 25109, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19132, 25109, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19133, 25109, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19134, 25110, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19135, 25110, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19136, 25110, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19137, 25111, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19138, 25111, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19139, 25111, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19140, 25112, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19141, 25112, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19142, 25112, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19143, 25113, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19144, 25113, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19145, 25113, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19146, 25114, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19147, 25114, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19148, 25114, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19149, 25115, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19150, 25115, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19151, 25115, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19152, 25116, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19153, 25116, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19154, 25116, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19155, 25117, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19156, 25117, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19157, 25117, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19158, 25118, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19159, 25118, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19160, 25118, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19161, 25119, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19162, 25119, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19163, 25119, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19164, 25120, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19165, 25120, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19166, 25120, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19167, 25121, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19168, 25121, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19169, 25121, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19170, 25122, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19171, 25122, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19172, 25122, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19173, 25123, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19174, 25123, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19175, 25123, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19176, 25127, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19177, 25127, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19178, 25127, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19179, 25128, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19180, 25128, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19181, 25128, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19182, 25129, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19183, 25129, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19184, 25129, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19185, 25130, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19186, 25130, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19187, 25130, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19188, 25131, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19189, 25131, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19190, 25131, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19191, 25132, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19192, 25132, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19193, 25132, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19194, 25133, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19195, 25133, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19196, 25133, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19197, 25134, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19198, 25134, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19199, 25134, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19200, 25135, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19201, 25135, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19202, 25135, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19203, 25136, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19204, 25136, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19205, 25136, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19206, 25137, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19207, 25137, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (19208, 25137, 4)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (107, N'menu', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (109, N'service', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (110, N'service', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 0, 0, 0)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (115, N'hall', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (116, N'menu', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (117, N'branch', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 0, 0, 0)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (119, N'hall', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (120, N'branch', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (121, N'branch', N'19bd9499-008b-483a-b52b-9596f89e04fc', 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (220, N'demo123', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (1220, N'product owner', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (1247, N'du an 1', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2250, N'25082', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2251, N'25083', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2252, N'25084', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2253, N'25085', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2254, N'25086', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2255, N'25088', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2256, N'25087', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2257, N'25089', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2258, N'25090', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2259, N'25091', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2260, N'25092', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2261, N'25093', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2262, N'25094', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2263, N'25095', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2264, N'25096', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2265, N'25097', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2266, N'25098', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2267, N'25099', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2268, N'25100', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2269, N'25101', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2270, N'25102', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2271, N'25103', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2272, N'25104', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2273, N'25105', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2274, N'25106', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2275, N'25107', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2276, N'25108', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2277, N'25109', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2278, N'25110', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2279, N'25111', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2280, N'25112', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2281, N'25113', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2282, N'25114', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2283, N'25115', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2284, N'25116', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2285, N'25117', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2286, N'25118', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2287, N'25119', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2288, N'25120', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2289, N'25121', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2290, N'25122', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2291, N'25123', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2292, N'25126', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2293, N'25127', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2294, N'25128', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2295, N'25129', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2296, N'25130', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2297, N'25131', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2298, N'25132', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2299, N'25133', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2300, N'25134', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2301, N'25135', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2302, N'25136', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (2303, N'25137', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCategory] ON 

INSERT [dbo].[ServiceCategory] ([CategoryId], [Name], [Description]) VALUES (1002, N'ca nhạc miệt vườn', N'nhạc sóng hay bao dui')
INSERT [dbo].[ServiceCategory] ([CategoryId], [Name], [Description]) VALUES (1003, N'chụp hình cưới chất lượng', N'photograhper chất lượng đó nha')
INSERT [dbo].[ServiceCategory] ([CategoryId], [Name], [Description]) VALUES (2003, N'thuê đồ đám cưới', N'siêu đẹp')
SET IDENTITY_INSERT [dbo].[ServiceCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceEntity] ON 

INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (3, N'ca sĩ rhyder', 1002, N'lại là di gì hao', 200000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697901562/eauroko2bvikhunhkxji.webp')
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (4, N'chụp hình 4k', 1003, N'chất lượng', 1200000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697124453/fmeqqw3djhstqdujc4wf.jpg')
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (5, N'bolero đám cưới', 1002, N'quá dui', 300000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697131760/wxfbltzpcow9h1pjqgsx.jpg')
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (1005, N'thuê áo vest nam', 2003, N'lịch lãm', 4000000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697901325/tqmny1hgevptfnx5bhgn.jpg')
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (1006, N'nhóm nhạc 365', 1002, N'dui nhộn', 8000000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697886252/wj11yaltm48ul3ilrerm.webp')
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (2005, N'váy cưới cô dâu', 2003, N'xinh cute', 5000000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697901296/i7ce9intygpmxp3vsljr.jpg')
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (2006, N'bánh kem đám cưới', 2003, N'bánh kem đám cưới', 450000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697901266/tufui3hhfvmpjopmt1tx.jpg')
SET IDENTITY_INSERT [dbo].[ServiceEntity] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskComment] ON 

INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (38, 1497, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'cmt', CAST(N'2024-05-13T09:56:14.6738672' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (45, 1495, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'ok', CAST(N'2024-05-14T13:58:32.0971841' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (87, 1496, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'123', CAST(N'2024-06-14T14:07:22.1688548' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TaskComment] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskToDo] ON 

INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1495, N'ngày mai nấu món mới ', 0, 1220, CAST(N'2024-05-10T18:02:19.4167409' AS DateTime2), N'task__tag--copyright', CAST(N'2024-06-03T18:51:17.1423241' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#f2dcf5')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1496, N'nhân viên thực hiện truyền thông cho nhà hàng bằng các phương thức như dùng mạng xã hội facebook, zalo, yahoo', 1, 1220, CAST(N'2024-05-12T12:10:53.8771731' AS DateTime2), N'task__tag--not-ready', CAST(N'2024-06-14T21:07:23.3313809' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#a19ec1ff')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1497, N'demo create task', 0, 1247, CAST(N'2024-05-12T12:11:07.0399592' AS DateTime2), N'task__tag--design', CAST(N'2024-06-14T21:12:19.6992688' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#ceecfd')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1531, N'12312', 1, 220, CAST(N'2024-06-14T21:06:54.4878621' AS DateTime2), N'task__tag--copyright', NULL, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#f2dcf5')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1533, N'12134', 3, 220, CAST(N'2024-06-14T21:09:53.7971043' AS DateTime2), N'task__tag--design', CAST(N'2024-06-14T21:10:08.1361222' AS DateTime2), N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#ceecfd')
SET IDENTITY_INSERT [dbo].[TaskToDo] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeOfDay] ON 

INSERT [dbo].[TimeOfDay] ([Id], [HallId], [Morning], [Afternoon], [Dinner]) VALUES (23, 2, N'7h - 10h', N'13h - 18h', N'19h - 23h')
INSERT [dbo].[TimeOfDay] ([Id], [HallId], [Morning], [Afternoon], [Dinner]) VALUES (30, 1002, N'123', N'12321', N'312inhtai')
INSERT [dbo].[TimeOfDay] ([Id], [HallId], [Morning], [Afternoon], [Dinner]) VALUES (31, 2002, N'123', N'12321', N'3')
INSERT [dbo].[TimeOfDay] ([Id], [HallId], [Morning], [Afternoon], [Dinner]) VALUES (36, 1, N'12', N'3312', N'3')
INSERT [dbo].[TimeOfDay] ([Id], [HallId], [Morning], [Afternoon], [Dinner]) VALUES (37, 1, N'312', N'3123', N'213')
SET IDENTITY_INSERT [dbo].[TimeOfDay] OFF
GO
SET IDENTITY_INSERT [dbo].[UserListTask] ON 

INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (119, 1495, N'12116240-b504-41bf-bcf6-9e906612ee3e')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (120, 1495, N'a733eed2-a179-4aa1-9624-3885a129c89b')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (121, 1495, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (126, 1496, N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (127, 1496, N'12116240-b504-41bf-bcf6-9e906612ee3e')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (128, 1497, N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (137, 1533, N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (138, 1533, N'12116240-b504-41bf-bcf6-9e906612ee3e')
SET IDENTITY_INSERT [dbo].[UserListTask] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallet] ON 

INSERT [dbo].[Wallet] ([WalletId], [UserId], [Coin]) VALUES (1, N'a733eed2-a179-4aa1-9624-3885a129c89b', 5177000)
INSERT [dbo].[Wallet] ([WalletId], [UserId], [Coin]) VALUES (2, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 32408000)
SET IDENTITY_INSERT [dbo].[Wallet] OFF
GO
ALTER TABLE [dbo].[AspNetRoles] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[Chat] ADD  DEFAULT ((0)) FOR [ChatRoomDataId]
GO
ALTER TABLE [dbo].[ComboMenuEntity] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [ComboPrice]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (N'') FOR [Avatar]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [BranchId]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((0)) FOR [HallId]
GO
ALTER TABLE [dbo].[MenuEntity] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[MenuEntity] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [Price]
GO
ALTER TABLE [dbo].[ServiceEntity] ADD  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_ChatRoom_ChatRoomDataId] FOREIGN KEY([ChatRoomDataId])
REFERENCES [dbo].[ChatRoom] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_ChatRoom_ChatRoomDataId]
GO
ALTER TABLE [dbo].[ChatPrivate]  WITH CHECK ADD  CONSTRAINT [FK_ChatPrivate_AspNetUsers_ReceiverUserId] FOREIGN KEY([ReceiverUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ChatPrivate] CHECK CONSTRAINT [FK_ChatPrivate_AspNetUsers_ReceiverUserId]
GO
ALTER TABLE [dbo].[ChatPrivate]  WITH CHECK ADD  CONSTRAINT [FK_ChatPrivate_AspNetUsers_SenderUserId] FOREIGN KEY([SenderUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ChatPrivate] CHECK CONSTRAINT [FK_ChatPrivate_AspNetUsers_SenderUserId]
GO
ALTER TABLE [dbo].[ChatRoomUser]  WITH CHECK ADD  CONSTRAINT [FK_ChatRoomUser_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChatRoomUser] CHECK CONSTRAINT [FK_ChatRoomUser_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChatRoomUser]  WITH CHECK ADD  CONSTRAINT [FK_ChatRoomUser_ChatRoom_ChatRoomId] FOREIGN KEY([ChatRoomId])
REFERENCES [dbo].[ChatRoom] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChatRoomUser] CHECK CONSTRAINT [FK_ChatRoomUser_ChatRoom_ChatRoomId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Branch_BranchId]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [FK_Hall_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [FK_Hall_Branch_BranchId]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Branch_BranchId] FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Branch_BranchId]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Hall_HallId] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Hall_HallId]
GO
ALTER TABLE [dbo].[InvoiceCode]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceCode_Code_CodeId] FOREIGN KEY([CodeId])
REFERENCES [dbo].[Code] ([CodeId])
GO
ALTER TABLE [dbo].[InvoiceCode] CHECK CONSTRAINT [FK_InvoiceCode_Code_CodeId]
GO
ALTER TABLE [dbo].[InvoiceCode]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceCode_Invoice_InvoiceId] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceCode] CHECK CONSTRAINT [FK_InvoiceCode_Invoice_InvoiceId]
GO
ALTER TABLE [dbo].[MenuEntity]  WITH CHECK ADD  CONSTRAINT [FK_MenuEntity_MenuCategory_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[MenuCategory] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuEntity] CHECK CONSTRAINT [FK_MenuEntity_MenuCategory_CategoryId]
GO
ALTER TABLE [dbo].[MenuItemComboMenu]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemComboMenu_ComboMenuEntity_ComboMenuId] FOREIGN KEY([ComboMenuId])
REFERENCES [dbo].[ComboMenuEntity] ([ComboMenuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuItemComboMenu] CHECK CONSTRAINT [FK_MenuItemComboMenu_ComboMenuEntity_ComboMenuId]
GO
ALTER TABLE [dbo].[MenuItemComboMenu]  WITH CHECK ADD  CONSTRAINT [FK_MenuItemComboMenu_MenuEntity_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[MenuEntity] ([MenuId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MenuItemComboMenu] CHECK CONSTRAINT [FK_MenuItemComboMenu_MenuEntity_MenuId]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[OrderMenu]  WITH CHECK ADD  CONSTRAINT [FK_OrderMenu_Invoice_InvoiceID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[OrderMenu] CHECK CONSTRAINT [FK_OrderMenu_Invoice_InvoiceID]
GO
ALTER TABLE [dbo].[OrderMenu]  WITH CHECK ADD  CONSTRAINT [FK_OrderMenu_MenuEntity_MenuId] FOREIGN KEY([MenuId])
REFERENCES [dbo].[MenuEntity] ([MenuId])
GO
ALTER TABLE [dbo].[OrderMenu] CHECK CONSTRAINT [FK_OrderMenu_MenuEntity_MenuId]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Invoice_InvoiceID] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Invoice_InvoiceID]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_ServiceEntity_ServiceId] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[ServiceEntity] ([ServiceId])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_ServiceEntity_ServiceId]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[ServiceEntity]  WITH CHECK ADD  CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ServiceCategory] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServiceEntity] CHECK CONSTRAINT [FK_ServiceEntity_ServiceCategory_CategoryId]
GO
ALTER TABLE [dbo].[TaskComment]  WITH CHECK ADD  CONSTRAINT [FK_TaskComment_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TaskComment] CHECK CONSTRAINT [FK_TaskComment_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[TaskComment]  WITH CHECK ADD  CONSTRAINT [FK_TaskComment_TaskToDo_TaskId] FOREIGN KEY([TaskId])
REFERENCES [dbo].[TaskToDo] ([TaskId])
GO
ALTER TABLE [dbo].[TaskComment] CHECK CONSTRAINT [FK_TaskComment_TaskToDo_TaskId]
GO
ALTER TABLE [dbo].[TaskToDo]  WITH CHECK ADD  CONSTRAINT [FK_TaskToDo_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[TaskToDo] CHECK CONSTRAINT [FK_TaskToDo_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[TaskToDo]  WITH CHECK ADD  CONSTRAINT [FK_TaskToDo_Project_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[TaskToDo] CHECK CONSTRAINT [FK_TaskToDo_Project_ProjectId]
GO
ALTER TABLE [dbo].[TimeOfDay]  WITH CHECK ADD  CONSTRAINT [FK_TimeOfDay_Hall_HallId] FOREIGN KEY([HallId])
REFERENCES [dbo].[Hall] ([HallId])
GO
ALTER TABLE [dbo].[TimeOfDay] CHECK CONSTRAINT [FK_TimeOfDay_Hall_HallId]
GO
ALTER TABLE [dbo].[UserListTask]  WITH CHECK ADD  CONSTRAINT [FK_UserListTask_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserListTask] CHECK CONSTRAINT [FK_UserListTask_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[UserListTask]  WITH CHECK ADD  CONSTRAINT [FK_UserListTask_TaskToDo_TaskId] FOREIGN KEY([TaskId])
REFERENCES [dbo].[TaskToDo] ([TaskId])
GO
ALTER TABLE [dbo].[UserListTask] CHECK CONSTRAINT [FK_UserListTask_TaskToDo_TaskId]
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD  CONSTRAINT [FK_Wallet_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Wallet] CHECK CONSTRAINT [FK_Wallet_AspNetUsers_UserId]
GO
