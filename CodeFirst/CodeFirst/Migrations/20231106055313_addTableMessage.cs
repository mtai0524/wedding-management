using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class addTableMessage : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
    name: "Message",
    columns: table => new
    {
        MessageId = table.Column<int>(type: "int", nullable: false)
            .Annotation("SqlServer:Identity", "1, 1"),
        Content = table.Column<string>(type: "nvarchar(max)", nullable: true),
        Timestamp = table.Column<DateTime>(type: "datetime2", nullable: true),
        ToRoomId = table.Column<int>(type: "int", nullable: true),
        RoomId = table.Column<int>(type: "int", nullable: true),
        FromUserId = table.Column<string>(type: "nvarchar(max)", nullable: true),
        ApplicationUserId = table.Column<string>(type: "nvarchar(450)", nullable: true)
    },
    constraints: table =>
    {
        table.PrimaryKey("PK_Message", x => x.MessageId);
        table.ForeignKey(
            name: "FK_Message_AspNetUsers_ApplicationUserId",
            column: x => x.ApplicationUserId,
            principalTable: "AspNetUsers",
            principalColumn: "Id");
        table.ForeignKey(
            name: "FK_Message_Room_RoomId",
            column: x => x.RoomId,
            principalTable: "Room",
            principalColumn: "RoomId");
    });
            migrationBuilder.CreateIndex(
                name: "IX_Message_ApplicationUserId",
                table: "Message",
                column: "ApplicationUserId");

            migrationBuilder.CreateIndex(
                name: "IX_Message_RoomId",
                table: "Message",
                column: "RoomId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {

            migrationBuilder.DropTable(
                name: "Message");
        }
    }
}
