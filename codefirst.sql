USE [codefirst]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Branch]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Chat]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[ChatPrivate]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[ChatRoom]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[ChatRoomUser]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Code]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[ComboMenuEntity]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Hall]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[HubConnection]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 5/30/2024 2:47:16 PM ******/
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
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceCode]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[MenuCategory]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[MenuEntity]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[MenuItemComboMenu]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[OrderMenu]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[OrderService]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[ServiceCategory]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[ServiceEntity]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[TaskComment]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[TaskToDo]    Script Date: 5/30/2024 2:47:16 PM ******/
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
/****** Object:  Table [dbo].[UserListTask]    Script Date: 5/30/2024 2:47:16 PM ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'12116240-b504-41bf-bcf6-9e906612ee3e', N'testchat@gmail.com', N'TESTCHAT@GMAIL.COM', N'testchat@gmail.com', N'TESTCHAT@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAENQv6gdKBBS32NvkVNJgUpDayHhL2w54HQxqID70BICqhIFTRj0KrSFW/nh77leMEg==', N'23IU7BCYHK4V2Y2H6KOBVJWYLAQBI4UY', N'db773fae-d97d-4bd2-a61d-98edaf50802d', NULL, 0, 0, NULL, 0, 0, N'ApplicationUser', N'chú 6', N'bán cháo', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1711173486/xgjzdekrfx7svd0tr8gb.png', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'98e152ed-a5d9-4ccb-93cf-ea5edf4e067c', N'testweb@zalo.com', N'TESTWEB@ZALO.COM', N'testweb@zalo.com', N'TESTWEB@ZALO.COM', 1, N'AQAAAAEAACcQAAAAEA0Z/fj6bRyF6p82LTJ0EqYgZLCHi37ONzE3rcgPI9P1xekttPLSmiLbyhguJCDLMg==', N'WL6A3HV25MZGLAVTHGL2HRVVRI3F3DFT', N'ea408a82-c8e6-4616-a872-7cd770694ed6', NULL, 0, 0, CAST(N'9999-12-31T23:59:59.9999999+00:00' AS DateTimeOffset), 1, 0, N'ApplicationUser', N'Gấu trúc', N'ẩn danh', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1709531347/jmqwdfdjj2zx88mtuocr.png', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'a1bf4a97-6196-416c-b55f-07ddc41ab715', N'anhbaysiu@gmail.com', N'ANHBAYSIU@GMAIL.COM', N'anhbaysiu@gmail.com', N'ANHBAYSIU@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEMB8C3DB20yWTGYxQuwmkrAiMf6Y0is0bDcPXm2DFZ8uXL4XfRuQIobnXCq8OkzzUg==', N'P6LV75SJTJ35M6ODOOFIZG3VTVH7C3AZ', N'a5100cf4-b8c2-47c0-b42e-fd2d356e429a', NULL, 0, 0, NULL, 0, 0, N'ApplicationUser', N'anh', N'bảy', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1711267650/ks7cg9xyssthvxsry2t0.jpg', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Discriminator], [FirstName], [LastName], [Avatar], [SessionId]) VALUES (N'a733eed2-a179-4aa1-9624-3885a129c89b', N'demodoan@gmail.com', N'DEMODOAN@GMAIL.COM', N'demodoan@gmail.com', N'DEMODOAN@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAEN2IMXVsQft3xf26tXxjuSUrAnpnZ/umdBKulgB0kyxK0SF4qEiJ74YjKsJhm5CPMQ==', N'63GMH2XNOYMUVDVGRWFGCMT5LSHS4CMP', N'892427ee-0e52-4d3e-9cfd-ef3e2201dee1', N'0795896039', 0, 0, NULL, 0, 0, N'ApplicationUser', N'demo', N'đồ án', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1716007814/qli90dbykkq1elbiffbp.png', NULL)
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

INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (1, N'chi nhánh 1', N'tốt', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696885246/usdl3fs3kbj68tupmj4e.jpg', N'Sài Gòn quận tám', N'0795896039', 0)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (2, N'chi nhánh 2', N'2', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696885367/mktdvsna2ffgmkxnhe1l.jpg', N'Bình Dương', N'0795896039', 0)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (3, N'chi nhánh 3', N'3', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696947043/wcb48vniwvberzaz94nr.jpg', N'Gò Vấp', N'0795896039', 1)
INSERT [dbo].[Branch] ([BranchId], [Name], [Description], [Image], [Address], [Phone], [IsLocked]) VALUES (1002, N'chi nhánh 4', N'123', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696884529/ktmnhyouikzxgza8udvp.jpg', N'Đồng Tháp', N'0795896039', 0)
SET IDENTITY_INSERT [dbo].[Branch] OFF
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
SET IDENTITY_INSERT [dbo].[ChatPrivate] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatRoom] ON 

INSERT [dbo].[ChatRoom] ([Id], [Name]) VALUES (1079, N'lost active class 123')
SET IDENTITY_INSERT [dbo].[ChatRoom] OFF
GO
SET IDENTITY_INSERT [dbo].[Code] ON 

INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (2004, N'MO38LEDKB72GHEW', 14, CAST(N'2023-10-28T03:34:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (4003, N'HUCLH65PQSK47FW', 50, CAST(N'2023-10-22T18:41:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (5003, N'YZ9S0IL9I2X0MP5', 15, CAST(N'2023-11-18T20:08:00.0000000' AS DateTime2), 17)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (5004, N'4XJ6EWJWNQCL8JW', 5, CAST(N'2025-11-21T20:09:00.0000000' AS DateTime2), 80)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (6003, N'696Y83IJ7NT66TG', 8, CAST(N'2024-02-24T21:19:00.0000000' AS DateTime2), 180)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (6004, N'voucher đặc biệt đó nghen', 90, CAST(N'2024-04-26T11:29:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (7003, N'2W7EO815MP3E5I9', 30, CAST(N'2023-10-27T16:09:00.0000000' AS DateTime2), 100)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (8003, N'XR2MFQP1OMXYOWO', 35, CAST(N'2023-10-27T10:15:00.0000000' AS DateTime2), 994)
INSERT [dbo].[Code] ([CodeId], [CodeString], [Discount], [ExpirationDate], [Quantity]) VALUES (9003, N'7LC78KRCPPBIO4U', 7, CAST(N'2024-11-08T17:57:00.0000000' AS DateTime2), 3100)
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
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Hall] ON 

INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (1, N'sảnh 1', N'1', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696882791/ognzfvrpzff5uji4jpbq.jpg', 3, 200, 50000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (2, N'sảnh thứ 2', N'2', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696882983/e8o7yah0ahoqucmjxzfu.jpg', 2, 600, 80000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (1002, N'sảnh 4', N'4', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696883008/wwmjobae0ysp8c11yd9n.jpg', 2, 1000, 900000000)
INSERT [dbo].[Hall] ([HallId], [Name], [Description], [Image], [BranchId], [Capacity], [Price]) VALUES (2002, N'sảnh 3', N'1123', N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697898782/vchmscy5ifrthdqjqv51.jpg', 2, 550, 400000000)
SET IDENTITY_INSERT [dbo].[Hall] OFF
GO
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17034, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-10-21T18:34:10.3587151' AS DateTime2), CAST(N'2025-11-25T11:13:27.0000000' AS DateTime2), 172378400, N'minh tai', N'test code', N'0795896039', NULL, NULL, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17035, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2, CAST(N'2023-10-21T18:35:33.9793116' AS DateTime2), CAST(N'2027-03-21T11:17:03.4560000' AS DateTime2), 12000, N'string', N'string', N'0795896039', NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17036, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 3, 1, CAST(N'2023-10-21T18:37:44.1250436' AS DateTime2), CAST(N'2023-12-21T11:04:10.0000000' AS DateTime2), 50090000, N'kdjsahkdhkasj', N'test', N'0795896039', NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17037, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 3, 1, CAST(N'2023-10-21T18:38:39.5847646' AS DateTime2), CAST(N'2023-12-22T11:04:10.0000000' AS DateTime2), 43077400, N'kdjsahkdhkasj', N'test', N'0795896039', NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17038, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 3, 1, CAST(N'2023-10-21T18:39:45.2042665' AS DateTime2), CAST(N'2024-01-19T11:04:10.0000000' AS DateTime2), 47549400, N'kdjsahkdhkasj', N'test', N'0795896039', NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17039, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 3, 1, CAST(N'2023-10-21T18:40:28.2240931' AS DateTime2), CAST(N'2028-01-19T11:04:10.0000000' AS DateTime2), 47549400, N'kdjsahkdhkasj', N'test', N'0795896039', NULL, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17040, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-10-21T18:42:18.6015642' AS DateTime2), CAST(N'2044-01-19T11:04:10.0000000' AS DateTime2), 76978800, N'minh tai', N'test', N'0795896039', NULL, 1, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (17041, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-10-21T18:55:33.8583342' AS DateTime2), CAST(N'2024-03-09T11:54:48.0000000' AS DateTime2), 75394080, N'minh tai', N'', N'0795896039', 209428000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (18041, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-10-21T20:11:32.1104405' AS DateTime2), CAST(N'2023-12-07T13:09:51.0000000' AS DateTime2), 172560000, N'nguyen minh tai', N'làm cho đàng hoàng nghen', N'0795896039', 215700000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (18042, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-10-21T22:21:43.3211385' AS DateTime2), CAST(N'2023-12-24T15:19:27.0000000' AS DateTime2), 345920800, N'đứa trẻ ở đại dương đen', N'đặt test thôi', N'0795896039', 432401000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (19041, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-10-22T08:11:00.5473745' AS DateTime2), CAST(N'2023-12-25T01:07:07.0000000' AS DateTime2), 279066480, N'đứa trẻ bay lên bầu trời đen', N'hehe', N'0795896039', 422828000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (20041, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 2002, CAST(N'2023-10-23T09:13:51.2464016' AS DateTime2), CAST(N'2024-05-24T01:56:04.0000000' AS DateTime2), 204925000, N'đứa trẻ ở đại dương đen', N'chuẩn bị đồ ăn cho ngon nhen!', N'0795896039', 409850000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23041, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-11-29T19:41:03.1773894' AS DateTime2), CAST(N'2024-07-11T12:27:12.0000000' AS DateTime2), 526286700, N'demo mail', N'hehe', N'0795896039', 923310000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23042, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-11-29T19:45:10.3205093' AS DateTime2), CAST(N'2024-07-19T12:27:12.0000000' AS DateTime2), 526286700, N'demo mail', N'hehe', N'0795896039', 923310000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23043, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-11-29T19:47:36.5130948' AS DateTime2), CAST(N'2024-07-20T12:27:12.0000000' AS DateTime2), 526286700, N'demo mail', N'hehe', N'0795896039', 923310000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23044, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-11-29T19:56:44.4237991' AS DateTime2), CAST(N'2024-07-26T12:27:12.0000000' AS DateTime2), 480121200, N'demo mail', N'hehe', N'0795896039', 923310000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23045, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-11-29T20:15:09.2631560' AS DateTime2), CAST(N'2024-07-30T12:27:12.0000000' AS DateTime2), 480121200, N'demo mail', N'hehe', N'0795896039', 923310000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23046, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2023-11-29T20:17:29.4790882' AS DateTime2), CAST(N'2024-08-02T12:27:12.0000000' AS DateTime2), 480121200, N'demo mail', N'hehe', N'0795896039', 923310000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23047, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:20:38.6696161' AS DateTime2), CAST(N'2024-03-15T13:20:06.0000000' AS DateTime2), 394077100, N'demo mail nha', N'hehe', N'0795896039', 414818000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (23048, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:24:16.2657068' AS DateTime2), CAST(N'2024-03-16T13:20:06.0000000' AS DateTime2), 394077100, N'demo mail nha', N'hehe', N'0795896039', 414818000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24041, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:30:16.9279882' AS DateTime2), CAST(N'2024-03-17T13:20:06.0000000' AS DateTime2), 394077100, N'demo mail nha', N'hehe', N'0795896039', 414818000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24042, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:37:05.0348199' AS DateTime2), CAST(N'2024-03-19T13:20:06.0000000' AS DateTime2), 331854400, N'demo mail nha', N'hehe', N'0795896039', 414818000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24043, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:41:07.6263542' AS DateTime2), CAST(N'2024-03-21T13:20:06.0000000' AS DateTime2), 331854400, N'demo mail nha', N'hehe', N'0795896039', 414818000, NULL, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24044, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:42:44.5766903' AS DateTime2), CAST(N'2024-03-22T13:20:06.0000000' AS DateTime2), 333214400, N'demo mail nha', N'hehe', N'0795896039', 416518000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24045, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:46:00.0639770' AS DateTime2), CAST(N'2024-03-23T13:20:06.0000000' AS DateTime2), 340414400, N'demo mail nha', N'hehe', N'0795896039', 425518000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24046, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:48:17.6905464' AS DateTime2), CAST(N'2024-03-30T13:20:06.0000000' AS DateTime2), 340414400, N'demo mail nha', N'hehe', N'0795896039', 425518000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24047, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T20:57:04.1206853' AS DateTime2), CAST(N'2024-03-31T13:20:06.0000000' AS DateTime2), 346454400, N'gửi mail đó nha', N'hehe', N'0795896039', 433068000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24048, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2023-11-29T21:02:30.3743723' AS DateTime2), CAST(N'2024-04-02T13:20:06.0000000' AS DateTime2), 346830400, N'gửi mail đó nha', N'hehe', N'0795896039', 433538000, NULL, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24049, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-11T17:54:22.5014233' AS DateTime2), CAST(N'2026-05-13T10:53:20.0000000' AS DateTime2), 451369000, N'12312', N'312312', N'3123123123', 902738000, 1, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24050, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-11T18:12:45.3391664' AS DateTime2), CAST(N'2029-05-18T11:11:56.0000000' AS DateTime2), 450608500, N'met moi that su', N'123123', N'1234567890', 901217000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24051, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-11T18:15:12.9067243' AS DateTime2), CAST(N'2034-05-10T11:14:38.0000000' AS DateTime2), 829755360, N'met roi nha may', N'312312', N'1234567890', 901908000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24053, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-11T18:24:48.6863238' AS DateTime2), CAST(N'2026-05-20T11:24:15.0000000' AS DateTime2), 450434000, N'met moi', N'1312312', N'1234567890', 900868000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24054, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-11T19:10:15.6272985' AS DateTime2), CAST(N'2028-05-12T12:08:11.0000000' AS DateTime2), 450989000, N'nguyen minh tai', N'1231231', N'1234567890', 901978000, 0, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24055, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-11T19:12:47.4244334' AS DateTime2), CAST(N'2033-05-12T12:12:04.0000000' AS DateTime2), 774607160, N'nguyen minihtai ', N'123123', N'1234567890', 900706000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24056, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2, CAST(N'2024-05-11T19:53:15.0090900' AS DateTime2), CAST(N'2026-05-20T12:52:24.0000000' AS DateTime2), 40990000, N'minh tai', N'12312', N'0795896039', 81980000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24057, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2002, CAST(N'2024-05-11T19:55:38.8155264' AS DateTime2), CAST(N'2027-05-20T12:54:55.0000000' AS DateTime2), 359849400, N'minh tai', N'1231', N'0795896039', 413620000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24058, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 2, CAST(N'2024-05-11T19:59:02.5228401' AS DateTime2), CAST(N'2029-05-23T12:58:21.0000000' AS DateTime2), 79541360, N'minh tai', N'1234', N'0795896039', 86458000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24060, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', 2, 1002, CAST(N'2024-05-13T02:33:02.4433934' AS DateTime2), CAST(N'2024-06-05T19:31:45.0000000' AS DateTime2), 829288000, N'minh tai', N'123', N'0795896039', 901400000, 1, N'Đã hủy đơn hàng')
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24061, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-05-18T11:58:12.5896919' AS DateTime2), CAST(N'2024-07-27T04:57:22.0000000' AS DateTime2), 904200000, N'minh tai', N'', N'0795896039', 904200000, 0, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24062, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-05-29T00:01:46.0372456' AS DateTime2), CAST(N'2024-08-19T17:00:48.0000000' AS DateTime2), 451369000, N'123', N'123', N'0795896039', 902738000, 0, NULL)
INSERT [dbo].[Invoice] ([InvoiceID], [UserId], [BranchId], [HallId], [InvoiceDate], [AttendanceDate], [Total], [FullName], [Note], [PhoneNumber], [TotalBeforeDiscount], [PaymentStatus], [OrderStatus]) VALUES (24063, N'a733eed2-a179-4aa1-9624-3885a129c89b', 2, 1002, CAST(N'2024-05-29T00:05:54.5403438' AS DateTime2), CAST(N'2024-08-14T17:02:02.0000000' AS DateTime2), 900218000, N'123123', N'123', N'0795896039', 900218000, 1, NULL)
SET IDENTITY_INSERT [dbo].[Invoice] OFF
GO
SET IDENTITY_INSERT [dbo].[InvoiceCode] ON 

INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1013, 17035, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1014, 17037, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1015, 17038, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1016, 17039, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1017, 17040, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1018, 17040, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1019, 17041, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (1020, 17041, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (2002, 18041, 5003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (2003, 18041, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (2004, 18042, 5003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (2005, 18042, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (3002, 19041, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (3003, 19041, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (3004, 19041, 5003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (4002, 20041, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7002, 23041, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7003, 23041, 8003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7004, 23042, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7005, 23042, 8003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7006, 23043, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7007, 23043, 8003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7008, 23044, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7009, 23044, 8003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (7010, 23044, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8002, 24042, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8003, 24042, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8004, 24042, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8005, 24043, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8006, 24043, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8007, 24043, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8008, 24044, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8009, 24044, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8010, 24044, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8011, 24045, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8012, 24045, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8013, 24045, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8014, 24046, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8015, 24046, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8016, 24046, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8017, 24047, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8018, 24047, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8019, 24047, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8020, 24048, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8021, 24048, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8022, 24048, 9003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8023, 24049, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8024, 24050, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8025, 24051, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8027, 24053, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8028, 24055, 2004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8029, 24056, 4003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8030, 24057, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8031, 24057, 5004)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8032, 24058, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8034, 24060, 6003)
INSERT [dbo].[InvoiceCode] ([InvoiceCodeId], [InvoiceId], [CodeId]) VALUES (8035, 24062, 4003)
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

INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (1, N'gỏi ngó sen', 1500000, N'chua chua ngọt ngọt', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697897801/ksje0ljhxjodwqxstrzp.avif')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (2, N'gà nướng muối ớt', 550000, N'cay the the', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695780160/iabwci36lwdkknyoq8wp.webp')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3, N'gỏi tôm với cổ hủ dừa', 18000, N'dòn dòn', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695780331/wjekau3rbzkclqf9pf2m.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4, N'gà bó xôi', 20000, N'mềm chiên dòn', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695779804/ixwrxvecrmhhxylcfz24.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (2002, N'tàu hủ nước đường', 20000, N'ngọt ngọt có gừng', 1002, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695779822/se1vxj5xk7wahyejmrse.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3002, N'lẩu thái chua cay', 650000, N'chua chua cay cay', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1695700316/cnqfdr3ztcb9hgxy29j5.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3003, N'cơm tấm lankmark 81', 200000, N'ngon mà đắt quá', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696914902/xwzkmrsnhb0io1crj3sy.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (3004, N'cơm chiên dương châu', 180000, N'cơm chiên mềm xốp', 1, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1696914992/mklusfkirfwlm9pxpw1m.jpg')
INSERT [dbo].[MenuEntity] ([MenuId], [Name], [Price], [Description], [CategoryId], [Image]) VALUES (4003, N'tôm hùm alaska', 10000000, N'ngon lắm nha', 2, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697885197/mwumokag8gp6xnqhjzcq.jpg')
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
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderMenu] ON 

INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16043, 17034, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16044, 17034, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16045, 17034, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16046, 17035, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16047, 17036, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16048, 17036, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16049, 17036, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16050, 17036, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16051, 17037, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16052, 17037, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16053, 17037, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16054, 17037, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16055, 17038, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16056, 17038, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16057, 17038, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16058, 17038, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16059, 17039, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16060, 17039, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16061, 17039, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16062, 17039, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16063, 17040, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16064, 17040, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16065, 17040, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16066, 17040, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16067, 17040, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16068, 17041, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16069, 17041, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (16070, 17041, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17031, 18041, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17032, 18041, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17033, 18041, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17034, 18041, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17035, 18041, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17036, 18041, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17037, 18041, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17038, 18042, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17039, 18042, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17040, 18042, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17041, 18042, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17042, 18042, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17043, 18042, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17044, 18042, 5005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17045, 18042, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17046, 18042, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17047, 18042, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17048, 18042, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17049, 18042, 5013)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17050, 18042, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17051, 18042, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17052, 18042, 5014)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17053, 18042, 5006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17054, 18042, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (17055, 18042, 5008)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18031, 19041, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18032, 19041, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18033, 19041, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18034, 19041, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18035, 19041, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18036, 19041, 5005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18037, 19041, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18039, 19041, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18040, 19041, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (18041, 19041, 5014)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (19031, 20041, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (19032, 20041, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (19033, 20041, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22031, 23041, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22032, 23041, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22033, 23041, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22034, 23041, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22035, 23041, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22036, 23041, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22037, 23041, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22038, 23041, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22039, 23042, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22040, 23042, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22041, 23042, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22042, 23042, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22043, 23042, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22044, 23042, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22045, 23042, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22046, 23042, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22047, 23043, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22048, 23043, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22049, 23043, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22050, 23043, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22051, 23043, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22052, 23043, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22053, 23043, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22054, 23043, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22055, 23044, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22056, 23044, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22057, 23044, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22058, 23044, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22059, 23044, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22060, 23044, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22061, 23044, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22062, 23044, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22063, 23045, 2)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22064, 23045, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22065, 23045, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22066, 23045, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22067, 23045, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22068, 23045, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22069, 23045, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22070, 23045, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22071, 23046, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22072, 23046, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22073, 23046, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22074, 23046, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22075, 23046, 4005)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22076, 23046, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22077, 23046, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22078, 23046, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22079, 23047, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22080, 23047, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22081, 23047, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22082, 23047, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22083, 23047, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22084, 23047, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22085, 23048, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22086, 23048, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22087, 23048, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22088, 23048, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22089, 23048, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (22090, 23048, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23031, 24041, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23032, 24041, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23033, 24041, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23034, 24041, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23035, 24041, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23036, 24041, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23037, 24042, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23038, 24042, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23039, 24042, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23040, 24042, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23041, 24042, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23042, 24042, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23043, 24043, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23044, 24043, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23045, 24043, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23046, 24043, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23047, 24043, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23048, 24043, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23049, 24044, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23050, 24044, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23051, 24044, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23052, 24044, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23053, 24044, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23054, 24044, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23055, 24045, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23056, 24045, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23057, 24045, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23058, 24045, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23059, 24045, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23060, 24045, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23061, 24046, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23062, 24046, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23063, 24046, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23064, 24046, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23065, 24046, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23066, 24046, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23067, 24047, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23068, 24047, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23069, 24047, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23070, 24047, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23071, 24047, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23072, 24047, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23075, 24048, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23076, 24048, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23077, 24048, 5004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23078, 24048, 3004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23079, 24048, 4003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23080, 24048, 6003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23083, 24048, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23084, 24049, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23085, 24049, 1)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23086, 24049, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23087, 24049, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23088, 24049, 2002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23089, 24050, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23090, 24050, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23091, 24050, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23092, 24050, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23093, 24050, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23094, 24050, 5013)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23095, 24050, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23096, 24050, 5008)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23097, 24051, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23098, 24051, 4007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23099, 24051, 4006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23100, 24051, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23104, 24053, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23105, 24053, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23106, 24053, 3003)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23107, 24054, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23108, 24054, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23109, 24054, 5006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23110, 24054, 5007)
GO
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23111, 24054, 5008)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23112, 24055, 3)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23113, 24055, 4)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23114, 24055, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23115, 24055, 5013)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23116, 24055, 5014)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23117, 24055, 5012)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23118, 24055, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23119, 24055, 5008)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23120, 24056, 4004)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23121, 24056, 5013)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23122, 24056, 5006)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23123, 24056, 5007)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23124, 24056, 2)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23125, 24056, 3002)
INSERT [dbo].[OrderMenu] ([OrderMenuId], [InvoiceID], [MenuId]) VALUES (23126, 24056, 3003)
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
SET IDENTITY_INSERT [dbo].[OrderMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11008, 17035, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11009, 17038, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11010, 17038, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11011, 17039, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11012, 17039, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11013, 17040, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11014, 17040, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11015, 17040, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11016, 17040, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11017, 17040, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11018, 17041, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (11019, 17041, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12002, 18041, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12003, 18041, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12004, 18042, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12005, 18042, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12006, 18042, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12007, 18042, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12008, 18042, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12009, 18042, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (12010, 18042, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (13002, 19041, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (13003, 19041, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (13004, 19041, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (13005, 19041, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (14002, 20041, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (14003, 20041, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17002, 23041, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17003, 23041, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17004, 23042, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17005, 23042, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17006, 23043, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17007, 23043, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17008, 23044, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (17009, 23044, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18002, 24044, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18003, 24044, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18004, 24044, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18005, 24045, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18006, 24045, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18007, 24045, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18008, 24045, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18009, 24045, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18010, 24046, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18011, 24046, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18012, 24046, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18013, 24046, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18014, 24046, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18015, 24047, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18016, 24047, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18017, 24047, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18018, 24047, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18019, 24047, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18020, 24048, 1005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18021, 24048, 2005)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18022, 24048, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18023, 24048, 1006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18024, 24048, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18025, 24048, 2006)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18026, 24051, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18027, 24054, 4)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18028, 24054, 5)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18029, 24058, 3)
INSERT [dbo].[OrderService] ([OrderServiceId], [InvoiceID], [ServiceId]) VALUES (18030, 24058, 5)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (92, N'hall', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (107, N'menu', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (109, N'service', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 0, 0, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (110, N'service', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 0, 0, 0)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (114, N'branch', N'c892040c-ec2f-44bc-a528-cddf39d00fb9', 1, 0, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (115, N'hall', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 1, 1, 1)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (116, N'menu', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 0, 0, 0)
INSERT [dbo].[Permission] ([Id], [Type], [RoleId], [CanAdd], [CanDelete], [CanEdit]) VALUES (117, N'branch', N'f7312e5b-b0dc-46af-b2dd-0910f7ab3a80', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (220, N'demo', NULL, NULL)
INSERT [dbo].[Project] ([ProjectId], [Name], [CreatedAt], [UpdatedAt]) VALUES (1220, N'product owner', NULL, NULL)
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
INSERT [dbo].[ServiceEntity] ([ServiceId], [Name], [CategoryId], [Description], [Price], [Image]) VALUES (2006, N'bánh kem đám cưới', 2003, N'bánh kem ăn không hết nổi', 450000, N'https://res.cloudinary.com/dl3hvap4a/image/upload/v1697901266/tufui3hhfvmpjopmt1tx.jpg')
SET IDENTITY_INSERT [dbo].[ServiceEntity] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskComment] ON 

INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (36, 1498, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'xin chào', CAST(N'2024-05-12T05:19:59.0178277' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (37, 1498, N'a733eed2-a179-4aa1-9624-3885a129c89b', N'hiện tại vấn đề an toàn thực phầm phải được đưa lên hàng đầu', CAST(N'2024-05-12T05:26:20.7946293' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (38, 1497, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'cmt', CAST(N'2024-05-13T09:56:14.6738672' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (45, 1495, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'ok', CAST(N'2024-05-14T13:58:32.0971841' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (58, 1498, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'demo cmt', CAST(N'2024-05-15T13:11:35.2091629' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (80, 1498, N'12116240-b504-41bf-bcf6-9e906612ee3e', N'cmt', CAST(N'2024-05-17T01:27:09.9767870' AS DateTime2))
INSERT [dbo].[TaskComment] ([TaskCommentId], [TaskId], [UserId], [Comment], [CreatedAt]) VALUES (81, 1498, N'12116240-b504-41bf-bcf6-9e906612ee3e', N'xin chao', CAST(N'2024-05-17T01:27:13.3261836' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TaskComment] OFF
GO
SET IDENTITY_INSERT [dbo].[TaskToDo] ON 

INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1495, N'ngày mai nấu món mới ', 0, 220, CAST(N'2024-05-10T18:02:19.4167409' AS DateTime2), N'task__tag--illustration', NULL, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#d6ede2')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1496, N'nhân viên thực hiện truyền thông cho nhà hàng bằng các phương thức như dùng mạng xã hội facebook, zalo, yahoo', 2, 220, CAST(N'2024-05-12T12:10:53.8771731' AS DateTime2), N'task__tag--copyright', NULL, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#f2dcf5')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1497, N'demo create task', 2, 1220, CAST(N'2024-05-12T12:11:07.0399592' AS DateTime2), N'task__tag--design', NULL, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#ceecfd')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1498, N'đảm bảo an toàn thực phầm và cải thiện dịch vụ nhà hàng', 1, 1220, CAST(N'2024-05-12T12:11:50.9324390' AS DateTime2), N'task__tag--copyright', NULL, N'fa3cca06-fba5-48a1-a7e0-4fb9d5b54594', N'#f2dcf5')
INSERT [dbo].[TaskToDo] ([TaskId], [Name], [Position], [ProjectId], [CreatedAt], [Priority], [UpdatedAt], [UserId], [TaskColor]) VALUES (1500, N'123', 0, 1220, CAST(N'2024-05-17T08:26:30.8838915' AS DateTime2), N'task__tag--not-ready', NULL, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6', N'#a19ec1ff')
SET IDENTITY_INSERT [dbo].[TaskToDo] OFF
GO
SET IDENTITY_INSERT [dbo].[UserListTask] ON 

INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (119, 1495, N'12116240-b504-41bf-bcf6-9e906612ee3e')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (120, 1495, N'a733eed2-a179-4aa1-9624-3885a129c89b')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (121, 1495, N'debc41d6-0223-4aaf-948a-b1c75e4b0bd6')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (122, 1498, N'12116240-b504-41bf-bcf6-9e906612ee3e')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (123, 1498, N'08f3f05d-b266-4c3e-99b4-12c0d926a8d3')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (124, 1498, N'98e152ed-a5d9-4ccb-93cf-ea5edf4e067c')
INSERT [dbo].[UserListTask] ([UserListTaskId], [TaskId], [UserId]) VALUES (125, 1498, N'a733eed2-a179-4aa1-9624-3885a129c89b')
SET IDENTITY_INSERT [dbo].[UserListTask] OFF
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
