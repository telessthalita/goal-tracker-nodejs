ALTER TABLE "goal_completions" DROP CONSTRAINT "goal_completions_id_goals_id_fk";
--> statement-breakpoint
ALTER TABLE "goal_completions" ADD COLUMN "goal_id" text NOT NULL;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "goal_completions" ADD CONSTRAINT "goal_completions_goal_id_goals_id_fk" FOREIGN KEY ("goal_id") REFERENCES "public"."goals"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
