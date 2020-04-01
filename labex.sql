
--schema create here//Task1
create schema DirectMarketing 

Authorization dbo ;


--create Tables//Task2
create TABLE [DirectMarketing].[CampaignResponse](
	[CampaignResponseId] [int] IDENTITY(1,1) NOT NULL,
	
	[NumberOfResponses] [int] NOT NULL,
	[CampaignName] [varchar](50) NOT NULL,
	[Location] [varchar](40) NOT NULL,
	[InterestedPeople] [int] NOT NULL,
	[ConfirmedPeople] [int] NOT NULL,
	ResponseProfit as (NumberOfResponses)persisted,
 CONSTRAINT [PK_CampaignResponse] PRIMARY KEY CLUSTERED 
(
	[CampaignResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--create table //Task3
CREATE TABLE [DirectMarketing].[Competitor](
	[CompetitorId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
	[Location] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Competitor] PRIMARY KEY CLUSTERED 
(
	[CompetitorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--create table//Task4
CREATE TABLE [DirectMarketing].[Advertisement](
	[AdvertisementId] [int] IDENTITY(1,1) NOT NULL,
	[AdvertisementName] [varchar](50) NOT NULL,
	[AdvertisementContent] [varchar](70) NOT NULL,
	[NoOfCast] [int] NOT NULL,
	[Cost] [float] NOT NULL,
	[Rating] [int] NOT NULL,
	[ChannelName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO