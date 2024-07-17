using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class tableTimeOfDay : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            

            migrationBuilder.CreateTable(
                name: "TimeOfDay",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    HallId = table.Column<int>(type: "int", nullable: true),
                    Morning = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Afternoon = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Dinner = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TimeOfDay", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TimeOfDay_Hall_HallId",
                        column: x => x.HallId,
                        principalTable: "Hall",
                        principalColumn: "HallId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_TimeOfDay_HallId",
                table: "TimeOfDay",
                column: "HallId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TimeOfDay");

          
        }
    }
}
